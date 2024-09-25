//
//  Code_HistoryApp.swift
//  Code History
//
//  Created by Florian Ouilhon on 24/09/2024.
//

import SwiftUI

@main
struct Code_HistoryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            WelcomeView()
        }
    }
}
