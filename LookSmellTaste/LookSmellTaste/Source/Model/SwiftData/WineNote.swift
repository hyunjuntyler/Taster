//
//  WineNote.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/8/23.
//

import SwiftUI
import SwiftData

@Model
final class WineNote {
    var name: String = ""
    var date: Date = Date()
    var type: WineType = wineTypes[2]
    @Attribute(.externalStorage) var image: Data?
    var color: WineColor = wineColors[0]
    var scents: [WineScent] = []
    var taste: [Double] = [0, 0, 0, 0, 0]
    var think: String = ""
    var rating: Double = 0.0
    
    init(name: String, date: Date, type: WineType, image: Data? = nil, color: WineColor, think: String, rating: Double) {
        self.name = name
        self.date = date
        self.type = type
        self.image = image
        self.color = color
        self.think = think
        self.rating = rating
    }
}
