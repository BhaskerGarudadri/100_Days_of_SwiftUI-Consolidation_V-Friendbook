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
    @NSManaged public var tags: String?
    @NSManaged public var friends: NSSet?
    
        var wrappedID: String {
            id ?? "Unknown ID"
        }
        
        var wrappedName: String {
            name ?? "Anonymous"
        }
        
        var wrappedCompany: String {
            company ?? "Unemployed"
        }
        
        var wrappedEmail: String {
            email ?? "Unknown email"
        }
        
        var wrappedAddress: String {
            address ?? "Unknown address"
        }
        
        var wrappedAbout: String {
            about ?? "Missin bio"
        }

        var wrappedRegistered: Date {
            registered ?? Date.now
        }
        
        var wrappedTags: String {
            tags ?? "No tags"
        }
        
        var friendsArray: [CachedFriend] {
            let set = friends as? Set<CachedFriend> ?? []
            
            return set.sorted {
                $0.wrappedName < $1.wrappedName
            }
        }
}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
