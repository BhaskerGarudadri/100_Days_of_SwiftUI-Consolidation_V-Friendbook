//
//  FriendbookApp.swift
//  Friendbook
//
//  Created by Edwin Przeźwiecki Jr. on 01/02/2023.
//

import SwiftUI

@main
struct FriendbookApp: App {
    
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.containter.viewContext)
        }
    }
}
