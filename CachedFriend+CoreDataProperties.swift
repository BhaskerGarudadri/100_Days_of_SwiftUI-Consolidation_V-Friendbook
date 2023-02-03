//
//  CachedFriend+CoreDataProperties.swift
//  Friendbook
//
//  Created by Edwin Przeźwiecki Jr. on 03/02/2023.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?
    
        var wrappedID: String {
            id ?? "Unknown ID"
        }
        
        var wrappedName: String {
            name ?? "Anonymous"
        }
        
        var wrappedUser: CachedUser {
            user ?? CachedUser()
        }

}

extension CachedFriend : Identifiable {

}
