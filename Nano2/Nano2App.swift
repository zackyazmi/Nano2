//
//  Nano2App.swift
//  Nano2
//
//  Created by Zacky Ilahi Azmi on 20/07/22.
//

import SwiftUI

@main
struct Nano2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
