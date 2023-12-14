//
//  WhiskeyNote.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI
import SwiftData

@Model
final class WhiskeyNote {
    var user: User?
    var name: String = ""
    var date: Date = Date()
    var type: WhiskeyType = whiskeyTypes[0]
    @Attribute(.externalStorage) var image: Data?
    var color: WhiskeyColor = whiskeyColors[0]
    var flavors: [WhiskeyFlavor] = []
    var taste: [Double] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    var think: String = ""
    var rating: Double = 0.0
    
    init(name: String, date: Date, type: WhiskeyType, color: WhiskeyColor, flavors: [WhiskeyFlavor], taste: [Double], think: String, rating: Double) {
        self.name = name
        self.date = date
        self.type = type
        self.color = color
        self.flavors = flavors
        self.taste = taste
        self.think = think
        self.rating = rating
    }
}
