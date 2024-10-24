//
//  MigrationPlan.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import Foundation
import SwiftData

actor MigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [SchemaV1.self, SchemaV2.self]
    }
    
    static var stages: [MigrationStage] {
        [migrateV1toV2]
    }
    
    private static var wineTastingNotes: [WineTastingNote] = []
    private static var coffeeTastingNotes: [CoffeeTastingNote] = []
    private static var whiskeyTastingNotes: [WhiskeyTastingNote] = []
    private static var cocktailTastingNotes: [CocktailTastingNote] = []
    
    static let migrateV1toV2 = MigrationStage.custom(
        fromVersion: SchemaV1.self,
        toVersion: SchemaV2.self,
        willMigrate: { context in
            let wineNotes = try context.fetch(FetchDescriptor<WineNote>())
            let coffeeNotes = try context.fetch(FetchDescriptor<CoffeeNote>())
            let whiskeyNotes = try context.fetch(FetchDescriptor<WhiskeyNote>())
            let cocktailNotes = try context.fetch(FetchDescriptor<CocktailNote>())
            
            wineTastingNotes = wineNotes.map {
                WineTastingNote(
                    title: $0.name,
                    category: $0.type.imageName,
                    createdAt: $0.date,
                    look: $0.color.imageName,
                    smells: $0.scents.map { $0.imageName },
                    tastes: zip(Wine.labels, $0.taste).map { Taste(label: $0, value: $1) },
                    think: $0.think,
                    rating: $0.rating,
                    isFavorite: false
                )
            }
            
            coffeeTastingNotes = coffeeNotes.map {
                CoffeeTastingNote(
                    title: $0.name,
                    category: $0.type.imageName,
                    createdAt: $0.date,
                    look: "",
                    smells: $0.flavors.map { $0.imageName },
                    tastes: zip(Coffee.labels, $0.taste).map { Taste(label: $0, value: $1) },
                    think: $0.think,
                    rating: $0.rating,
                    isFavorite: false
                )
            }
            
            whiskeyTastingNotes = whiskeyNotes.map {
                WhiskeyTastingNote(
                    title: $0.name,
                    category: $0.type.imageName,
                    createdAt: $0.date,
                    look: $0.color.imageName,
                    smells: $0.flavors.map { $0.imageName },
                    tastes: zip(Whiskey.labels, $0.taste).map { Taste(label: $0, value: $1) },
                    finish: Finish(value: 0, note: ""),
                    think: $0.think,
                    rating: $0.rating,
                    isFavorite: false
                )
            }
            
            cocktailTastingNotes = cocktailNotes.map {
                CocktailTastingNote(
                    title: $0.name,
                    category: $0.type.imageName,
                    createdAt: $0.date,
                    look: "",
                    smells: [],
                    tastes: zip(Cocktail.labels, $0.taste).map { Taste(label: $0, value: $1) },
                    think: $0.think,
                    rating: $0.rating,
                    isFavorite: false,
                    ingredients: $0.ingredients.map { $0.converted },
                    isContainsIce: $0.isIce
                )
            }
        }, didMigrate: { context in
            wineTastingNotes.forEach { context.insert($0) }
            coffeeTastingNotes.forEach { context.insert($0) }
            whiskeyTastingNotes.forEach { context.insert($0) }
            cocktailTastingNotes.forEach { context.insert($0) }
            
            try context.save()
        }
    )
}
