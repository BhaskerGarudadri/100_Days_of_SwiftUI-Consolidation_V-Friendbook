//
//  CachedUser+CoreDataProperties.swift
//  Friendbook
//
//  Created by Edwin Przeźwiecki Jr. on 03/02/2023.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: [String]?
    @NSManaged public var friends: [CachedFriend]?
    
    public var wrappedID: String {
        id ?? "Unknown ID"
    }
    
    public var wrappedName: String {
        name ?? "Anonymous"
    }
    
    public var wrappedCompany: String {
        company ?? "Unemployed"
    }
    
    public var wrappedEmail: String {
        email ?? "Unknown email"
    }
    
    public var wrappedAddress: String {
        address ?? "Unknown address"
    }
    
    public var wrappedAbout: String {
        about ?? "Missin bio"
    }

    public var wrappedRegistered: Date {
        registered ?? Date()
    }
    
    public var wrappedTags: [String] {
        tags ?? []
    }
    
    public var wrappedFriends: [CachedFriend] {
        friends ?? []
    }
}

extension CachedUser : Identifiable {

}
