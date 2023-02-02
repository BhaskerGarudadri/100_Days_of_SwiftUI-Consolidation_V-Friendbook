//
//  User.swift
//  Friendbook
//
//  Created by Edwin Przeźwiecki Jr. on 01/02/2023.
//

import SwiftUI

class Users: ObservableObject {
    
    @Published var usersDetails = [User]()
    
    init() {
        guard usersDetails.isEmpty else { return }
        
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let downloadedUsers = data {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    let decodedUsers = try decoder.decode([User].self, from: downloadedUsers)
                    DispatchQueue.main.async {
                        self.usersDetails = decodedUsers
                    }
                } else {
                    print("No data found.")
                }
            } catch {
                print("Download error: \(error.localizedDescription)")
            }
        }
        .resume()
    }
}

struct User: Codable {
    
    struct Friend: Codable {
        let id: String
        let name: String
    }
    
    let id: String
    var isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    static let example = User(id: "", isActive: true, name: "", age: 18, company: "", email: "", address: "", about: "", registered: Date(), tags: [], friends: [])
}
