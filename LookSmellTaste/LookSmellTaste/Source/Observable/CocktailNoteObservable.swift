//
//  CockatilNoteObservable.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/10/23.
//

import SwiftUI

@Observable
final class CocktailNoteObservable {
    var name: String = ""
    var date: Date = Date()
    var type: CocktailType = cocktailTypes[0]
    var image: Data?
    var ingredients: [CocktailIngredient] = []
    var isIce: Bool = false
    var taste: [Double] = [0.0, 0.0, 0.0]
    var think: String = ""
    var rating: Double = 0.0
    
    static var shared = CocktailNoteObservable()
    
    func reset() {
        name = ""
        date = Date()
        type = cocktailTypes[0]
        image = nil
        ingredients = []
        isIce = false
        taste = [0, 0, 0]
        think = ""
        rating = 0.0
    }
    
    func getColorName(for color: Color) -> String {
        if let ingredientColor = cocktailIngredientColors.first(where: { $0.color == color }) {
            return ingredientColor.name
        }
        return "black"
    }
    
    func getColor(for name: String) -> Color {
        if let ingredientColor = cocktailIngredientColors.first(where: { $0.name == name }) {
            return ingredientColor.color
        }
        return .black
    }
}
