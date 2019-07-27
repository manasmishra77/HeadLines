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
        return frc
    }()
    
    private var headLineModel: HeadLinesModel?
    
    var numberOfItems: Int {
        return headLineModel?.articles?.count ?? 0
    }
    
    func getItem(for index: Int) -> Articles? {
      let article = headLineModel?.articles?[index]
        return article
    }
    func fetchHeadLines(completion: @escaping SuccessCompletionBlock) {
        fetchHeadLinesModelFromCoreDataEntity() ? completion(true) : completion(false)
        NetworkManager.getHeadLines {[weak self] (isSuccess, model) in
            self?.headLineModel = model
            if isSuccess {
                DispatchQueue.main.async {
                    completion(true)
                }
                self?.clearData()
                self?.saveInCoreData()
            }
        }
    }
}

//Helper function related to data fetching
extension HeadLinesViewModel {
    //This function is used to clear all data from coredata
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
    //This function is used to store all data from coredata
    private func saveInCoreData() {
        guard let articles = self.headLineModel?.articles else {
            return
        }
        do {
            let articlesData = try JSONEncoder().encode(articles)
            let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
            if let headLinesEntity = NSEntityDescription.insertNewObject(forEntityName: "HeadLines", into: context) as? HeadLines {
                headLinesEntity.articles = articlesData as NSData
                headLinesEntity.status = self.headLineModel?.status
                try CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
            }
        } catch let error {
            print(error)
        }
    }
    //This function is used to fetch all data from coredata
    private func fetchHeadLinesModelFromCoreDataEntity() -> Bool {
        do {
            try self.fetchedhResultController.performFetch()
            if let nsObjectHeadlinesModel = fetchedhResultController.fetchedObjects?.first as? HeadLines {
                var headlines = HeadLinesModel.init()
                headlines.articles = nsObjectHeadlinesModel.ariclesArray
                headlines.status = nsObjectHeadlinesModel.status
                self.headLineModel = headlines
                return true
            }
        } catch {
            print("ERROR: \(error)")
        }
        return false
    }

}

