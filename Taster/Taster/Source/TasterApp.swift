//
//  Taster.swift
//  Taster
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI
import SwiftData

@main
struct TasterApp: App {
    
    init() {
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [User.self])
        }
    }
}
