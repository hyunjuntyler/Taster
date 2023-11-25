//
//  User.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 11/25/23.
//

import SwiftData
import SwiftUI

@Model
final class User {
    @Attribute(.unique) var id = UUID()
    var name: String
    @Attribute(.externalStorage) var image: Data?
    
    @Relationship(deleteRule: .cascade) var wineNotes: [WineNote]?

    init(name: String) {
        self.name = name
    }
}
