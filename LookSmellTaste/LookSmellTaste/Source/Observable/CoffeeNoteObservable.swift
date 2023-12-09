//
//  CoffeeNoteObservable.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI

@Observable
final class CoffeeNoteObservable {
    var name: String = ""
    var date: Date = Date()
    var type: CoffeeType = coffeeTypes[0]
    var image: Data?
    var flavor: [CoffeeFlavor] = []
    var taste: [Double] = [0.0, 0.0, 0.0, 0.0, 0.0]
    var think: String = ""
    var rating: Double = 0.0
    
    static var shared = CoffeeNoteObservable()
    
    func reset() {
        name = ""
        date = Date()
        type = coffeeTypes[0]
        image = nil
        flavor = []
        taste = [0, 0, 0, 0, 0]
        think = ""
        rating = 0.0
    }
}
