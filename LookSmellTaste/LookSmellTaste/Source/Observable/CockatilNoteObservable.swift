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
}
