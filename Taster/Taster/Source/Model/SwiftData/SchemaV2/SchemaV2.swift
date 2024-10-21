//
//  SchemaV2.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import Foundation
import SwiftData

enum SchemaV2: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [WineTastingNote.self, CoffeeTastingNote.self, WhiskeyTastingNote.self, CocktailTastingNote.self]
    }
    
    static var versionIdentifier = Schema.Version(2, 0, 0)
}

extension SchemaV2 {
    protocol TastingNote {
        var title: String { get set }
        var category: String { get set }
        var createdAt: Date { get set }
        var thumnail: Data? { get set }
        var look: String { get set }
        var smell: [String] { get set }
        var taste: [Double] { get set }
        var think: String { get set }
        var rating: Double { get set }
    }
    
    @Model final class WineTastingNote: TastingNote {
        var title: String
        var category: String
        var createdAt: Date
        @Attribute(.externalStorage) var thumnail: Data?
        var look: String
        var smell: [String]
        var taste: [Double]
        var think: String
        var rating: Double
        
        init(
            title: String,
            category: String,
            createdAt: Date,
            look: String,
            smell: [String],
            taste: [Double],
            think: String,
            rating: Double
        ) {
            self.title = title
            self.category = category
            self.createdAt = createdAt
            self.look = look
            self.smell = smell
            self.taste = taste
            self.think = think
            self.rating = rating
        }
    }
    
    @Model final class CoffeeTastingNote: TastingNote {
        var title: String
        var category: String
        var createdAt: Date
        @Attribute(.externalStorage) var thumnail: Data?
        var look: String
        var smell: [String]
        var taste: [Double]
        var think: String
        var rating: Double
        
        init(
            title: String,
            category: String,
            createdAt: Date,
            look: String,
            smell: [String],
            taste: [Double],
            think: String,
            rating: Double
        ) {
            self.title = title
            self.category = category
            self.createdAt = createdAt
            self.look = look
            self.smell = smell
            self.taste = taste
            self.think = think
            self.rating = rating
        }
    }
    
    @Model final class WhiskeyTastingNote: TastingNote {
        var title: String
        var category: String
        var createdAt: Date
        @Attribute(.externalStorage) var thumnail: Data?
        var look: String
        var smell: [String]
        var taste: [Double]
        var think: String
        var rating: Double
        
        init(
            title: String,
            category: String,
            createdAt: Date,
            look: String,
            smell: [String],
            taste: [Double],
            think: String,
            rating: Double
        ) {
            self.title = title
            self.category = category
            self.createdAt = createdAt
            self.look = look
            self.smell = smell
            self.taste = taste
            self.think = think
            self.rating = rating
        }
    }
    
    @Model final class CocktailTastingNote: TastingNote {
        var title: String
        var category: String
        var createdAt: Date
        @Attribute(.externalStorage) var thumnail: Data?
        var look: String
        var smell: [String]
        var taste: [Double]
        var think: String
        var rating: Double
        var ingredients: [Ingredient] = []
        var containsIce: Bool = false
        
        init(
            title: String,
            category: String,
            createdAt: Date,
            look: String,
            smell: [String],
            taste: [Double],
            think: String,
            rating: Double,
            ingredients: [Ingredient],
            containsIce: Bool
        ) {
            self.title = title
            self.category = category
            self.createdAt = createdAt
            self.look = look
            self.smell = smell
            self.taste = taste
            self.think = think
            self.rating = rating
            self.ingredients = ingredients
            self.containsIce = containsIce
        }
    }
    
    struct Ingredient: Codable {
        var name: String
        var amount: Double
        var colorString: String
    }
}

