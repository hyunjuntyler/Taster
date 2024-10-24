//
//  SchemaV2.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import Foundation
import SwiftData

typealias Taste = SchemaV2.Taste
typealias Ingredient = SchemaV2.Ingredient
typealias TastingNote = SchemaV2.TastingNote
typealias WineTastingNote = SchemaV2.WineTastingNote
typealias CoffeeTastingNote = SchemaV2.CoffeeTastingNote
typealias WhiskeyTastingNote = SchemaV2.WhiskeyTastingNote
typealias CocktailTastingNote = SchemaV2.CocktailTastingNote

actor SchemaV2: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [WineTastingNote.self, CoffeeTastingNote.self, WhiskeyTastingNote.self, CocktailTastingNote.self]
    }
    
    static var versionIdentifier = Schema.Version(2, 0, 0)
}

extension SchemaV2 {
    protocol TastingNote: PersistentModel {
        var title: String { get set }
        var category: String { get set }
        var createdAt: Date { get set }
        var imageData: Data? { get set }
        var look: String { get set }
        var smells: [String] { get set }
        var tastes: [Taste] { get set }
        var think: String { get set }
        var rating: Double { get set }
    }
    
    @Model final class WineTastingNote: TastingNote {
        var title: String
        var category: String
        var createdAt: Date
        @Attribute(.externalStorage) var imageData: Data?
        var look: String
        var smells: [String]
        var tastes: [Taste]
        var think: String
        var rating: Double
        
        init(
            title: String,
            category: String,
            createdAt: Date,
            look: String,
            smells: [String],
            tastes: [Taste],
            think: String,
            rating: Double
        ) {
            self.title = title
            self.category = category
            self.createdAt = createdAt
            self.look = look
            self.smells = smells
            self.tastes = tastes
            self.think = think
            self.rating = rating
        }
        
        convenience init() {
            self.init(
                title: "",
                category: "",
                createdAt: .now,
                look: "",
                smells: [],
                tastes: [],
                think: "",
                rating: 0.0
            )
        }
    }
    
    @Model final class CoffeeTastingNote: TastingNote {
        var title: String
        var category: String
        var createdAt: Date
        @Attribute(.externalStorage) var imageData: Data?
        var look: String
        var smells: [String]
        var tastes: [Taste]
        var think: String
        var rating: Double
        
        init(
            title: String,
            category: String,
            createdAt: Date,
            look: String,
            smells: [String],
            tastes: [Taste],
            think: String,
            rating: Double
        ) {
            self.title = title
            self.category = category
            self.createdAt = createdAt
            self.look = look
            self.smells = smells
            self.tastes = tastes
            self.think = think
            self.rating = rating
        }
        
        convenience init() {
            self.init(
                title: "",
                category: "",
                createdAt: .now,
                look: "",
                smells: [],
                tastes: [],
                think: "",
                rating: 0.0
            )
        }
    }
    
    @Model final class WhiskeyTastingNote: TastingNote {
        var title: String
        var category: String
        var createdAt: Date
        @Attribute(.externalStorage) var imageData: Data?
        var look: String
        var smells: [String]
        var tastes: [Taste]
        var think: String
        var rating: Double
        
        init(
            title: String,
            category: String,
            createdAt: Date,
            look: String,
            smells: [String],
            tastes: [Taste],
            think: String,
            rating: Double
        ) {
            self.title = title
            self.category = category
            self.createdAt = createdAt
            self.look = look
            self.smells = smells
            self.tastes = tastes
            self.think = think
            self.rating = rating
        }
        
        convenience init() {
            self.init(
                title: "",
                category: "",
                createdAt: .now,
                look: "",
                smells: [],
                tastes: [],
                think: "",
                rating: 0.0
            )
        }
    }
    
    @Model final class CocktailTastingNote: TastingNote {
        var title: String
        var category: String
        var createdAt: Date
        @Attribute(.externalStorage) var imageData: Data?
        var look: String
        var smells: [String]
        var tastes: [Taste]
        var think: String
        var rating: Double
        var ingredients: [Ingredient]
        var containsIce: Bool
        
        init(
            title: String,
            category: String,
            createdAt: Date,
            look: String,
            smells: [String],
            tastes: [Taste],
            think: String,
            rating: Double,
            ingredients: [Ingredient],
            containsIce: Bool
        ) {
            self.title = title
            self.category = category
            self.createdAt = createdAt
            self.look = look
            self.smells = smells
            self.tastes = tastes
            self.think = think
            self.rating = rating
            self.ingredients = ingredients
            self.containsIce = containsIce
        }
        
        convenience init() {
            self.init(
                title: "",
                category: "",
                createdAt: .now,
                look: "",
                smells: [],
                tastes: [],
                think: "",
                rating: 0.0,
                ingredients: [],
                containsIce: false
            )
        }
    }
    
    struct Taste: Hashable, Codable {
        let label: String
        var value: Double
    }
    
    struct Ingredient: Hashable, Codable {
        var name: String
        var amount: Double
        var colorString: String
    }
}

extension SchemaV2 {
#if DEBUG
    static var sample: ModelContainer {
        do {
            let schema = Schema(versionedSchema: SchemaV2.self)
            let configurations = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: schema, configurations: configurations)
            Task { @MainActor in
                wineTastingNotes.forEach { container.mainContext.insert($0) }
                whiskeyTastingNotes.forEach { container.mainContext.insert($0) }
                coffeeTastingNotes.forEach { container.mainContext.insert($0) }
                cocktailTastingNotes.forEach { container.mainContext.insert($0) }
            }
                
            return container
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    static var wineTastingNotes: [WineTastingNote] {
        [
            .init(
                title: "와인 1",
                category: "redWine",
                createdAt: .now,
                look: "copper",
                smells: ["olive", "plum"],
                tastes: zip(Wine.labels, [5, 4, 3, 2, 4]).map { Taste(label: $0, value: $1) },
                think: "think",
                rating: 5.0
            ),
            .init(
                title: "와인 2",
                category: "whiteWine",
                createdAt: .now,
                look: "gold",
                smells: ["jasmine", "butter"],
                tastes: zip(Wine.labels, [4, 3, 2, 2, 3]).map { Taste(label: $0, value: $1) },
                think: "think",
                rating: 4.0
            )
        ]
    }
    
    static var whiskeyTastingNotes: [WhiskeyTastingNote] {
        [
            .init(
                title: "위스키 1",
                category: "bourbonWhiskey",
                createdAt: .now,
                look: "gold",
                smells: ["lemon", "raisin"],
                tastes: zip(Whiskey.labels, [3, 4, 5, 1, 2, 4]).map { Taste(label: $0, value: $1) },
                think: "think",
                rating: 3.5
            ),
            .init(
                title: "위스키 2",
                category: "scotchWhiskey",
                createdAt: .now,
                look: "copper",
                smells: ["popcorn", "strawberry"],
                tastes: zip(Whiskey.labels, [2, 5, 5, 3, 2, 5]).map { Taste(label: $0, value: $1) },
                think: "think",
                rating: 4.5
            )
        ]
    }
    
    static var coffeeTastingNotes: [CoffeeTastingNote] {
        [
            .init(
                title: "커피 1",
                category: "capsuleCoffee",
                createdAt: .now,
                look: "",
                smells: ["mango"],
                tastes: zip(Coffee.labels, [3, 4, 3, 3, 4]).map { Taste(label: $0, value: $1) },
                think: "think",
                rating: 4.5
            ),
            .init(
                title: "커피 2",
                category: "cafeCoffee",
                createdAt: .now,
                look: "",
                smells: ["kiwi", "cherry"],
                tastes: zip(Coffee.labels, [5, 4, 2, 3, 3]).map { Taste(label: $0, value: $1) },
                think: "think",
                rating: 4.0
            )
        ]
    }
    
    static var cocktailTastingNotes: [CocktailTastingNote] {
        [
            .init(
                title: "칵테일 1",
                category: "homeCocktail",
                createdAt: .now,
                look: "",
                smells: [],
                tastes: zip(Cocktail.labels, [2, 2, 3]).map { Taste(label: $0, value: $1) },
                think: "think",
                rating: 4.0,
                ingredients: [
                    Ingredient(
                        name: "red",
                        amount: 1.0,
                        colorString: "red"
                    )
                ],
                containsIce: true
            ),
            .init(
                title: "칵테일 2",
                category: "barCocktail",
                createdAt: .now,
                look: "",
                smells: [],
                tastes: zip(Cocktail.labels, [2, 3, 3]).map { Taste(label: $0, value: $1) },
                think: "think",
                rating: 4.5,
                ingredients: [
                    Ingredient(
                        name: "yellow",
                        amount: 1.0,
                        colorString: "yellow"
                    ),
                    Ingredient(
                        name: "mint",
                        amount: 2.0,
                        colorString: "mint"
                    )
                ],
                containsIce: true
            )
        ]
    }
#endif
}
