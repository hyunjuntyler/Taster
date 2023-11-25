//
//  LookSmellTasteApp.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI
import SwiftData

@main
struct LookSmellTasteApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [User.self])
        }
    }
}
