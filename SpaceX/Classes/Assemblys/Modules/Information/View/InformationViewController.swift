//
//  InformationViewController.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController, InformationViewInput {

    var output: InformationViewOutput!
    private var launchModel: Launch!
    private let imageManager = ImageService.shared
    
    @IBOutlet weak private var launchImage: UIImageView!
    @IBOutlet weak private var launchNameText: UILabel!
    @IBOutlet weak private var launchDescriptionText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        setupObject(model: launchModel)
        configureNavigationBar()
    }
    
    private func setupObject(model: Launch) {
        launchNameText.text = model.name
        launchDescriptionText.text = model.details
        if let imagePath = model.imagePath {
            launchImage.image = imageManager.getImage(imageName: imagePath)
        }
    }
}

// MARK: - Configure
extension InformationViewController {
    func configureNavigationBar() {
        let cancelButton = UIBarButtonItem(image: #imageLiteral(resourceName: "backButton"), style: .plain, target: self, action: #selector(cancelButtonAction(_:)))
        navigationItem.leftBarButtonItem = cancelButton
    }
}

// MARK: View Input
extension InformationViewController {
    func set(title: String) {
        //self.title = title
    }
    
    func set(model: Launch) {
        launchModel = model
    }
}

// MARK: Button Action
extension InformationViewController {
    @objc func cancelButtonAction(_ sender: Any?){
        output.cancel()
    }
}
