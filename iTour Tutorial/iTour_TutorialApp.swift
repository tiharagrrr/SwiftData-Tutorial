//
//  iTour_TutorialApp.swift
//  iTour Tutorial
//
//  Created by Tihara Egodage on 2025-12-03.
//

import SwiftData
import SwiftUI

@main
struct iTour_TutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self) //sort of a database + creates a modelcontext for us
    }
}
