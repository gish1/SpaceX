//
//  ObjectsListViewController.swift
//  SpaceX
//
//  Created by Пк on 14.08.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit
import CoreData

class ObjectsListViewController: UITableViewController, ObjectsListViewInput {
    var output: ObjectsListViewOutput!
    
    private var fetchedResultsController: NSFetchedResultsController<Launch>!
    private let persistence = PersistenceService.shared
    private let imageManager = ImageService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        setupFetchedResultsController(for: self.persistence.context)
        output.viewLoadInformation()
    }
    
    private func setupFetchedResultsController(for context: NSManagedObjectContext) {
        let fetchRequest = NSFetchRequest<Launch>(entityName: "Launch")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "launchYear", ascending: true)]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try controller.performFetch()
            fetchedResultsController = controller
            fetchedResultsController.delegate = self
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
    }
    
    private func getModelAtIndexPath(indexPath: IndexPath) -> Launch {
        guard let launch = self.fetchedResultsController?.object(at: indexPath) else {
            fatalError("Attempt to configure cell without a managed object")
        }
        return launch
    }
}

// MARK: - Configure

extension ObjectsListViewController: NSFetchedResultsControllerDelegate {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)

        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        }
        
        let launch = getModelAtIndexPath(indexPath: indexPath)
        cell?.textLabel?.text = launch.name
        cell?.detailTextLabel?.text = launch.launchYear
        
        cell?.imageView?.image = nil
        if let imagePath = launch.imagePath {
            cell?.imageView?.image = imageManager.getImage(imageName: imagePath)
        } else {
            cell?.imageView?.image = #imageLiteral(resourceName: "loadImage")
        }
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchedResultsController.sections else {
            return 0
        }
        return sections[section].numberOfObjects
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let launch = getModelAtIndexPath(indexPath: indexPath)
        output.handleInformationTap(with: launch)
        tableView.deselectRow(at: indexPath, animated: true)
    }
        
//MARK: - NSFetchedResultsControllerDelegate
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,didChange anObject: Any,at indexPath: IndexPath?,for type: NSFetchedResultsChangeType,newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            guard let newIndexPath = newIndexPath else { return }
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        case .delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRows(at: [indexPath], with: .fade)
        case .move:
            tableView.reloadData()
        case .update:
            guard let indexPath = indexPath else { return }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        default:
            break
        }
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,didChange sectionInfo: NSFetchedResultsSectionInfo,atSectionIndex sectionIndex: Int,for type: NSFetchedResultsChangeType) {
        switch type {
        case .delete:
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .automatic)
        case .insert:
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .automatic)
        default:
            break
        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.endUpdates()
    }
}

// MARK: View Input
extension ObjectsListViewController {
    
    func set(title: String) {
        //self.title = title
    }
}

// MARK: Button Action
extension ObjectsListViewController {
    
}
