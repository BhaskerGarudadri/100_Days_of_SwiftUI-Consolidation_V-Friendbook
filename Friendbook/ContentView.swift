//
//  ContentView.swift
//  Friendbook
//
//  Created by Edwin Przeźwiecki Jr. on 01/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var users = Users()
    
    var body: some View {
        NavigationView {
            List(users.usersDetails, id: \.id) { user in
                NavigationLink {
                    UserDetailsView(users: users.usersDetails, user: user, friends: user.friends)
                } label: {
                    HStack {
                        Text(user.name)
                        Spacer()
                        Text(user.isActive ? "Online" : "Offline")
                            .font(.system(size: 12))
                            .frame(maxWidth: 50, maxHeight: 30)
                            .background(user.isActive ? .green : .clear)
                            .clipShape(Capsule())
                    }
                }
            }
            .navigationTitle("Friendbook")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
