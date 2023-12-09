//
//  CoffeeNote.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 11/25/23.
//

import SwiftUI
import SwiftData

@Model
final class CoffeeNote {
    var user: User?
    var name: String = ""
    var date: Date = Date()
    var type: CoffeeType = coffeeTypes[0]
    @Attribute(.externalStorage) var image: Data?
    var flavor: [CoffeeFlavor] = []
    var taste: [Double] = [0.0, 0.0, 0.0, 0.0, 0.0]
    var think: String = ""
    var rating: Double = 0.0
    
    init(name: String, date: Date, type: CoffeeType, flavor: [CoffeeFlavor], taste: [Double], think: String, rating: Double) {
        self.name = name
        self.date = date
        self.type = type
        self.flavor = flavor
        self.taste = taste
        self.think = think
        self.rating = rating
    }
}
