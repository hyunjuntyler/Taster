//
//  WineNote.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/8/23.
//

import SwiftData
import SwiftUI

@Model
final class WineNote {
    var name: String
    var date: Date
    var type: WineType
    @Attribute(.externalStorage) var image: Data
    var color: WineColor
    var scents: [WineScent]
    var taste: [Double]
    var think: String
    var rating: Double
    
    init(
        name: String = "",
        date: Date = .now,
        type: WineType = wineTypes[2],
        image: Data,
        color: WineColor = wineColors[0],
        scents: [WineScent] = [],
        taste: [Double] = [0, 0, 0, 0, 0],
        think: String = "",
        rating: Double = 0.0
    ) {
        self.name = name
        self.date = date
        self.type = type
        self.image = image
        self.color = color
        self.scents = scents
        self.taste = taste
        self.think = think
        self.rating = rating
    }
}
