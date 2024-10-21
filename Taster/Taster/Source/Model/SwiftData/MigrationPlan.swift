//
//  MigrationPlan.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import Foundation
import SwiftData

enum MigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [SchemaV1.self, SchemaV2.self]
    }
    
    static var stages: [MigrationStage] {
        [migrateV1toV2]
    }
    
    private static var wineTastingNotes: [SchemaV2.WineTastingNote] = []
    private static var coffeeTastingNotes: [SchemaV2.CoffeeTastingNote] = []
    private static var whiskeyTastingNotes: [SchemaV2.WhiskeyTastingNote] = []
    private static var cocktailTastingNotes: [SchemaV2.CocktailTastingNote] = []
    
    static let migrateV1toV2 = MigrationStage.custom(
        fromVersion: SchemaV1.self,
        toVersion: SchemaV2.self,
        willMigrate: { context in
            let wineNotes = try context.fetch(FetchDescriptor<SchemaV1.WineNote>())
            let coffeeNotes = try context.fetch(FetchDescriptor<SchemaV1.CoffeeNote>())
            let whiskeyNotes = try context.fetch(FetchDescriptor<SchemaV1.WhiskeyNote>())
            let cocktailNotes = try context.fetch(FetchDescriptor<SchemaV1.CocktailNote>())
            
            wineTastingNotes = wineNotes.map {
                SchemaV2.WineTastingNote(
                    title: $0.name,
                    category: $0.type.imageName,
                    createdAt: $0.date,
                    look: $0.color.imageName,
                    smell: $0.scents.map { $0.imageName },
                    taste: $0.taste,
                    think: $0.think,
                    rating: $0.rating
                )
            }
            
            coffeeTastingNotes = coffeeNotes.map {
                SchemaV2.CoffeeTastingNote(
                    title: $0.name,
                    category: $0.type.imageName,
                    createdAt: $0.date,
                    look: "",
                    smell: $0.flavors.map { $0.imageName },
                    taste: $0.taste,
                    think: $0.think,
                    rating: $0.rating
                )
            }
            
            whiskeyTastingNotes = whiskeyNotes.map {
                SchemaV2.WhiskeyTastingNote(
                    title: $0.name,
                    category: $0.type.imageName,
                    createdAt: $0.date,
                    look: $0.color.imageName,
                    smell: $0.flavors.map { $0.imageName },
                    taste: $0.taste,
                    think: $0.think,
                    rating: $0.rating
                )
            }
            
            cocktailTastingNotes = cocktailNotes.map {
                SchemaV2.CocktailTastingNote(
                    title: $0.name,
                    category: $0.type.imageName,
                    createdAt: $0.date,
                    look: "",
                    smell: [],
                    taste: $0.taste,
                    think: $0.think,
                    rating: $0.rating,
                    ingredients: $0.ingredients.map { $0.converted },
                    containsIce: $0.isIce
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
