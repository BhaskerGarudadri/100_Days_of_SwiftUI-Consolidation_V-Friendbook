//
//  UserDetailsView.swift
//  Friendbook
//
//  Created by Edwin Przeźwiecki Jr. on 01/02/2023.
//

import SwiftUI

struct UserDetailsView: View {
    
    let users: [User]
    let user: User
    let friends: [User.Friend]
    
    var body: some View {
        List {
            Section("Age") {
                Text(String(user.age))
            }
            
            Section("Company") {
                Text(user.company)
            }
            
            Section("Email address") {
                Text(user.email)
            }
            
            Section("Home address") {
                Text(user.address)
            }
            
            Section("Bio") {
                Text(user.about)
            }
            
            Section("Date of registration") {
                Label(user.registered.formatted(date: .abbreviated, time: .complete), systemImage: "calendar")
            }
            
            Section("Tags") {
                HStack {
                    ForEach(user.tags, id: \.self) { tag in
                        Text(tag)
                            .padding(3)
                            .font(.system(size: 9))
                            .background(.tertiary)
                            .clipShape(Capsule())
                    }
                }
            }
            
            Section("Friends") {
                ForEach(friends, id: \.id) { friend in
                    NavigationLink {
                        if let user = locateUser(friend: friend, in: users) {
                            UserDetailsView(users: users, user: user, friends: user.friends)
                        }
                    } label: {
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func locateUser(friend: User.Friend, in array: [User]) -> User? {
        if let user = array.first(where: { $0.id == friend.id }) {
            return user
        }
        return nil
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(users: [], user: User.example, friends: [])
    }
}
