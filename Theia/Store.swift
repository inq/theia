//
//  Store.swift
//  Theia
//
//  Created by inkyu on 12/03/2019.
//  Copyright © 2019 q. All rights reserved.
//

import CoreData
import Foundation
import UIKit
class Store {
    static let shared = Store()

    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Theia")

        container.loadPersistentStores(completionHandler: { _, error in

            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext() {
        let context = Store.shared.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
