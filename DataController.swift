//
//  DataController.swift
//  Friendbook
//
//  Created by Edwin Przeźwiecki Jr. on 03/02/2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let containter = NSPersistentContainer(name: "Friendbook")
    
    init() {
        containter.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
            self.containter.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
