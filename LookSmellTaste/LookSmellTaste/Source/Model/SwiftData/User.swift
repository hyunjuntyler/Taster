//
//  User.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 11/25/23.
//

import SwiftUI
import SwiftData

@Model
final class User {
    var id = UUID()
    var name: String = ""
    var icon: String = ""
    @Attribute(.externalStorage) var image: Data?
    
    @Relationship(deleteRule: .cascade) var wineNotes: [WineNote]?

    init(name: String, icon: String) {
        self.name = name
        self.icon = icon
    }
}
