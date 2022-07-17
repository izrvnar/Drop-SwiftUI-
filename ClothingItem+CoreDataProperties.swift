//
//  ClothingItem+CoreDataProperties.swift
//  Drop
//
//  Created by Ivan Zrvnar on 2022-07-17.
//
//

import Foundation
import CoreData
import SwiftUI


extension ClothingItem {
    

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClothingItem> {
        return NSFetchRequest<ClothingItem>(entityName: "ClothingItem")
    }

    @NSManaged public var brand: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID
    @NSManaged public var image: String?
    @NSManaged public var link: String?
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var type: String?
    
    
    //MARK: Computed Properties
    public var wrappedBrand: String{
        brand ?? "Unkonwn Brand"
    }
    
    public var wrappedName: String{
        name ?? "Unknown Name"
    }
    
    public var wrappedDate: Date{
        date ?? Date()
    }
    
    public var wrappedLink: String{
        link ?? "https://www.google.com/"
    }
    
    public var wrappedNotes: String{
        notes ?? ""
    }
    
    public var wrappedType: String{
        type ?? "Other"
    }
    
    public var wrappedImage: String{
        let defaultImageString = UUID().uuidString
        return image ?? defaultImageString
    }
    
}



extension ClothingItem : Identifiable {

}
