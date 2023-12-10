//
//  CocktailModel.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/10/23.
//

import Foundation

struct CocktailType: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var imageName: String
}

let cocktailTypes: [CocktailType] = [
    CocktailType(name: "홈 칵테일", imageName: ""),
    CocktailType(name: "바 칵테일", imageName: "")
]
