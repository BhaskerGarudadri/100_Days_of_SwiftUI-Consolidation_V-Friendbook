//
//  UserDetailsView.swift
//  Friendbook
//
//  Created by Edwin Przeźwiecki Jr. on 01/02/2023.
//

import SwiftUI

struct UserDetailsView: View {
    
    let users: FetchedResults<CachedUser>
    let user: CachedUser
    
    var body: some View {
        List {
            Section("Age") {
                Text(String(user.age))
            }
            
            Section("Company") {
                Text(user.wrappedCompany)
            }
            
            Section("Email address") {
                Text(user.wrappedEmail)
            }
            
            Section("Home address") {
                Text(user.wrappedAddress)
            }
            
            Section("Bio") {
                Text(user.wrappedAbout)
            }
            
            Section("Date of registration") {
                Label(user.wrappedRegistered.formatted(date: .abbreviated, time: .complete), systemImage: "calendar")
            }
            
            Section("Tags") {
                HStack {
                    ForEach(user.wrappedTags.components(separatedBy: ","), id: \.self) { tag in
                        Text(tag)
                            .padding(3)
                            .font(.system(size: 9))
                            .background(.tertiary)
                            .clipShape(Capsule())
                    }
                }
            }
            
            Section("Friends") {
                ForEach(user.friendsArray, id: \.wrappedID) { friend in
                    NavigationLink {
                        if let user = locateUser(friend, in: users) {
                            UserDetailsView(users: users, user: user)
                        }
                    } label: {
                        Text(friend.wrappedName)
                    }
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle(user.wrappedName)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func locateUser(_ friend: CachedFriend, in array: FetchedResults<CachedUser>) -> CachedUser? {
        if let user = array.first(where: { $0.wrappedID == friend.wrappedID }) {
            return user
        }
        return nil
    }
}

//struct UserDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailsView()
//    }
//}
