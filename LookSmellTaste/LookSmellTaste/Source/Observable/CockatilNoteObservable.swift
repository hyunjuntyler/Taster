//
//  CockatilNoteObservable.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/10/23.
//

import SwiftUI

@Observable
final class CockatilNoteObservable {
    var name: String = ""
    var date: Date = Date()
    var type: CocktailType = cocktailTypes[0]
    var image: Data?
    var ingredients: [CocktailIngredient] = []
    var taste: [Double] = [0.0, 0.0, 0.0]
    var think: String = ""
    var rating: Double = 0.0
    
    static var shared = CockatilNoteObservable()
    
    func reset() {
        name = ""
        date = Date()
        type = cocktailTypes[0]
        image = nil
        taste = [0, 0, 0]
        think = ""
        rating = 0.0
    }
    
    func getColorName(for color: Color) -> String {
        let colorMap: [Color: String] = [
            .blue: "blue",
            .red: "red",
            .green: "green",
            .indigo: "indigo",
            .yellow: "yellow",
            .gray: "gray",
            .orange: "orange",
            .brown: "brown",
            .cyan: "cyan",
            .mint: "mint",
            .pink: "pink",
            .purple: "purple",
            .teal: "teal"
        ]
        
        return colorMap[color] ?? "error"
    }
}
