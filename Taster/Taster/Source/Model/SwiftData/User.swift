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
    @Relationship(deleteRule: .cascade) var coffeeNotes: [CoffeeNote]?
    @Relationship(deleteRule: .cascade) var cocktailNotes: [CocktailNote]?
    @Relationship(deleteRule: .cascade) var whiskeyNotes: [WhiskeyNote]?

    init(
        name: String,
        icon: String
    ) {
        self.name = name
        self.icon = icon
    }
}
