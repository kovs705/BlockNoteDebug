//
//  BlockNoteDebugApp.swift
//  BlockNoteDebug
//
//  Created by Kovs on 03.12.2021.
//

import SwiftUI

@main
struct BlockNoteDebugApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
