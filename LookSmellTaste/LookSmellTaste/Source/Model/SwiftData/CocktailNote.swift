//
//  CocktailNote.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 11/25/23.
//

import SwiftUI
import SwiftData

@Model
final class CocktailNote {
    var user: User?
    var name: String = ""
    var date: Date = Date()
    var type: CocktailType = cocktailTypes[0]
    @Attribute(.externalStorage) var image: Data?
    var ingredients: [CocktailIngredient] = []
    var isIce: Bool = false
    var taste: [Double] = [0.0, 0.0, 0.0]
    var think: String = ""
    var rating: Double = 0.0
    
    init(user: User? = nil, name: String, date: Date, type: CocktailType, isIce: Bool, taste: [Double], think: String, rating: Double) {
        self.user = user
        self.name = name
        self.date = date
        self.type = type
        self.isIce = isIce
        self.taste = taste
        self.think = think
        self.rating = rating
    }
}
