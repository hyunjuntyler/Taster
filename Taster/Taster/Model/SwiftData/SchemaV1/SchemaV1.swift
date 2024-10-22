//
//  SchemaV1.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import Foundation
import SwiftData
import SwiftUI

actor SchemaV1: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [User.self, WineNote.self, CoffeeNote.self, WhiskeyNote.self, CocktailNote.self]
    }
    
    static var versionIdentifier = Schema.Version(1, 0, 0)
}

extension SchemaV1 {
    @Model final class User {
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
    
    @Model final class WineNote {
        var user: User?
        var name: String = ""
        var date: Date = Date()
        var type: WineType = SchemaV1StoredProperty.wineTypes[2]
        @Attribute(.externalStorage) var image: Data?
        var color: WineColor = SchemaV1StoredProperty.wineColors[0]
        var scents: [WineScent] = []
        var taste: [Double] = [0, 0, 0, 0, 0]
        var think: String = ""
        var rating: Double = 0.0
        
        init(
            name: String,
            date: Date,
            type: WineType,
            color: WineColor,
            scents: [WineScent],
            taste: [Double],
            think: String,
            rating: Double
        ) {
            self.name = name
            self.date = date
            self.type = type
            self.color = color
            self.scents = scents
            self.taste = taste
            self.think = think
            self.rating = rating
        }
    }
    
    @Model final class CoffeeNote {
        var user: User?
        var name: String = ""
        var date: Date = Date()
        var type: CoffeeType = SchemaV1StoredProperty.coffeeTypes[0]
        @Attribute(.externalStorage) var image: Data?
        var flavors: [CoffeeFlavor] = []
        var taste: [Double] = [0.0, 0.0, 0.0, 0.0, 0.0]
        var think: String = ""
        var rating: Double = 0.0
        
        init(
            name: String,
            date: Date,
            type: CoffeeType,
            flavors: [CoffeeFlavor],
            taste: [Double],
            think: String,
            rating: Double
        ) {
            self.name = name
            self.date = date
            self.type = type
            self.flavors = flavors
            self.taste = taste
            self.think = think
            self.rating = rating
        }
    }
    
    @Model final class WhiskeyNote {
        var user: User?
        var name: String = ""
        var date: Date = Date()
        var type: WhiskeyType = SchemaV1StoredProperty.whiskeyTypes[0]
        @Attribute(.externalStorage) var image: Data?
        var color: WhiskeyColor = SchemaV1StoredProperty.whiskeyColors[0]
        var flavors: [WhiskeyFlavor] = []
        var taste: [Double] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        var think: String = ""
        var rating: Double = 0.0
        
        init(
            name: String,
            date: Date,
            type: WhiskeyType,
            color: WhiskeyColor,
            flavors: [WhiskeyFlavor],
            taste: [Double],
            think: String,
            rating: Double
        ) {
            self.name = name
            self.date = date
            self.type = type
            self.color = color
            self.flavors = flavors
            self.taste = taste
            self.think = think
            self.rating = rating
        }
    }
    
    @Model final class CocktailNote {
        var user: User?
        var name: String = ""
        var date: Date = Date()
        var type: CocktailType = SchemaV1StoredProperty.cocktailTypes[0]
        @Attribute(.externalStorage) var image: Data?
        var ingredients: [CocktailIngredient] = []
        var isIce: Bool = false
        var taste: [Double] = [0.0, 0.0, 0.0]
        var think: String = ""
        var rating: Double = 0.0
        
        init(
            user: User? = nil,
            name: String,
            date: Date,
            type: CocktailType,
            ingredients: [CocktailIngredient],
            isIce: Bool,
            taste: [Double],
            think: String,
            rating: Double
        ) {
            self.user = user
            self.name = name
            self.date = date
            self.type = type
            self.ingredients = ingredients
            self.isIce = isIce
            self.taste = taste
            self.think = think
            self.rating = rating
        }
    }
}

extension SchemaV1 {
    struct WineType: Identifiable, Codable, Hashable {
        var id = UUID()
        var name: String
        var imageName: String
    }

    struct WineColor: Identifiable, Codable, Hashable {
        var id = UUID()
        var name: String
        var imageName: String
    }

    struct WineScent: Identifiable, Codable, Hashable, Equatable {
        var id = UUID()
        var name: String
        var imageName: String
    }

    struct CoffeeType: Identifiable, Codable, Hashable {
        var id = UUID()
        var name: String
        var imageName: String
    }

    struct CoffeeFlavor: Identifiable, Codable, Hashable {
        var id = UUID()
        var name: String
        var imageName: String
    }
    
    struct WhiskeyType: Identifiable, Codable, Hashable {
        var id = UUID()
        var name: String
        var imageName: String
    }

    struct WhiskeyColor: Identifiable, Codable, Hashable {
        var id = UUID()
        var name: String
        var imageName: String
    }

    struct WhiskeyFlavor: Identifiable, Codable, Hashable, Equatable {
        var id = UUID()
        var name: String
        var imageName: String
    }
    
    struct CocktailType: Identifiable, Codable, Hashable {
        var id = UUID()
        var name: String
        var imageName: String
    }

    struct CocktailIngredient: Identifiable, Codable, Hashable {
        var id = UUID()
        var name: String
        var amount: Double
        var colorName: String
    }

    struct CocktailIngredientColor: Identifiable {
        var id = UUID()
        var name: String
        var color: Color
    }
}

extension SchemaV1.CocktailIngredient {
    var converted: SchemaV2.Ingredient {
        .init(name: name, amount: amount, colorString: colorName)
    }
}
