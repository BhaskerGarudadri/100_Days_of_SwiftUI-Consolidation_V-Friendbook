//
//  ContentView.swift
//  Friendbook
//
//  Created by Edwin Przeźwiecki Jr. on 01/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    /// Previous solution:
//    @StateObject var users = Users()
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                NavigationLink {
                    UserDetailsView(users: users, user: user, friends: user.friends)
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
            .task {
                await fetchUsers()
            }
        }
    }
    
    func fetchUsers() async {
        guard users.isEmpty else { return }
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            users = try decoder.decode([User].self, from: data)
        } catch {
            print("Download error: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
