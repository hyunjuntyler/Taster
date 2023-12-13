//
//  CocktailModel.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/10/23.
//

import SwiftUI

struct CocktailType: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var imageName: String
}

let cocktailTypes: [CocktailType] = [
    CocktailType(name: "홈 칵테일", imageName: "homeCocktail"),
    CocktailType(name: "바 칵테일", imageName: "barCocktail")
]

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

let cocktailIngredientColors: [CocktailIngredientColor] = [
    CocktailIngredientColor(name: "blue", color: .blue),
    CocktailIngredientColor(name: "red", color: .red),
    CocktailIngredientColor(name: "green", color: .green),
    CocktailIngredientColor(name: "indigo", color: .indigo),
    CocktailIngredientColor(name: "yellow", color: .yellow),
    CocktailIngredientColor(name: "gray", color: .gray),
    CocktailIngredientColor(name: "orange", color: .orange),
    CocktailIngredientColor(name: "brown", color: .brown),
    CocktailIngredientColor(name: "cyan", color: .cyan),
    CocktailIngredientColor(name: "mint", color: .mint),
    CocktailIngredientColor(name: "pink", color: .pink),
    CocktailIngredientColor(name: "purple", color: .purple),
    CocktailIngredientColor(name: "teal", color: .teal)
]
