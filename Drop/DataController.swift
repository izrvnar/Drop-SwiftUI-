//
//  DataController.swift
//  Drop
//
//  Created by Ivan Zrvnar on 2022-07-14.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "ClothingItem")
    
    init(){
        container.loadPersistentStores{
            description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
