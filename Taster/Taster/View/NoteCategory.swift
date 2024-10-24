//
//  NoteCategory.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/24/24.
//

import Foundation
import SwiftData
import SwiftUI

enum NoteCategory: String, CaseIterable, Identifiable {
    case wine, coffee, whiskey, cocktail
    
    var id: String { self.rawValue }
    
    var description: String {
        switch self {
        case .wine: "와인"
        case .coffee: "커피"
        case .whiskey: "위스키"
        case .cocktail: "칵테일"
        }
    }
    
    var imageSuffix: String {
        switch self {
        case .wine: "Wine"
        case .coffee: "Coffee"
        case .whiskey: "Whiskey"
        case .cocktail: "Cocktail"
        }
    }
    
    var imageResource: ImageResource {
        switch self {
        case .wine: .wine
        case .coffee: .coffee
        case .whiskey: .whiskey
        case .cocktail: .cocktail
        }
    }
    
    var model: any PersistentModel {
        switch self {
        case .wine: WineTastingNote()
        case .coffee: CoffeeTastingNote()
        case .whiskey: WhiskeyTastingNote()
        case .cocktail: CocktailTastingNote()
        }
    }
    
    var categories: [Category] {
        switch self {
        case .wine: Wine.categories
        case .coffee: Coffee.categories
        case .whiskey: Whiskey.categories
        case .cocktail: Cocktail.categories
        }
    }
    
    var looks: [Look] {
        switch self {
        case .wine: Wine.looks
        case .coffee: []
        case .whiskey: Whiskey.looks
        case .cocktail: []
        }
    }
    
    var smells: [Smell] {
        switch self {
        case .wine: Wine.smells
        case .coffee: Coffee.smells
        case .whiskey: Whiskey.smells
        case .cocktail: []
        }
    }
    
    var tastes: [Taste] {
        switch self {
        case .wine: Wine.labels.map { Taste(label: $0, value: 0) }
        case .coffee: Coffee.labels.map { Taste(label: $0, value: 0) }
        case .whiskey: Whiskey.labels.map { Taste(label: $0, value: 0) }
        case .cocktail: Cocktail.labels.map { Taste(label: $0, value: 0) }
        }
    }
    
    @MainActor
    var editNoteView: AnyView {
        switch self {
        case .wine: AnyView(EditNote<WineTastingNote>(category: self))
        case .coffee: AnyView(EditNote<CoffeeTastingNote>(category: self))
        case .whiskey: AnyView(EditNote<WhiskeyTastingNote>(category: self))
        case .cocktail: AnyView(EditNote<CocktailTastingNote>(category: self))
        }
    }
    
    static func getCategory(from model: any PersistentModel) -> NoteCategory {
        if model is WineTastingNote {
            return .wine
        } else if model is CoffeeTastingNote {
            return .coffee
        } else if model is WhiskeyTastingNote {
            return .whiskey
        } else if model is CocktailTastingNote {
            return .cocktail
        }
        
        fatalError("타입을 찾을 수 없습니다.")
    }
}
