//
//  HeadLinesViewModel.swift
//  HeadLines
//
//  Created by Manas Mishra on 24/07/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit
import CoreData


class HeadLinesViewModel: NSObject {
    
    lazy var fetchedhResultController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: HeadLines.self))
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "status", ascending: true)]
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.sharedInstance.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        return frc
    }()
    
    var completionBlock: SuccessCompletionBlock?
    
    private var headLineModel: HeadLines?
    
    var numberOfItems: Int {
        return headLineModel?.articles?.count ?? 0
    }
    
    func getItem(for index: Int) -> Articles? {
      let article = headLineModel?.articles?[index]
        return article
    }
    
    func fetchHeadLines(completion: @escaping SuccessCompletionBlock) {
        completionBlock = completion
        do {
            try self.fetchedhResultController.performFetch()
            completion(true)
        } catch {
            print("ERROR: \(error)")
        }
        
        NetworkManager.getHeadLines {[weak self] (isSuccess, model) in
            self?.headLineModel = model
            if isSuccess {
                self?.clearData()
                self?.saveInCoreData()
            }
        }
    }
    
    //This function is used to clear all data 
    private func clearData() {
        do {
            let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: HeadLines.self))
            do {
                let objects  = try context.fetch(fetchRequest) as? [NSManagedObject]
                _ = objects.map{$0.map{context.delete($0)}}
                CoreDataStack.sharedInstance.saveContext()
            } catch let error {
                print("ERROR DELETING : \(error)")
            }
        }
    }
    private func saveInCoreData() {
        do {
            try CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
        } catch let error {
            print(error)
        }
    }

}

extension HeadLinesViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        completionBlock?(true)
    }
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            
            break
            //self.tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .delete:
            break
            //self.tableView.deleteRows(at: [indexPath!], with: .automatic)
        default:
            break
        }
    }
}
