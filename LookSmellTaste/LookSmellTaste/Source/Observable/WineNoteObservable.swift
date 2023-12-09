//
//  WineNoteObservable.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/8/23.
//

import SwiftUI

@Observable
final class WineNoteObservable {
    var name: String = ""
    var date: Date = Date()
    var type: WineType = wineTypes[2]
    var image: Data?
    var color: WineColor = wineColors[0]
    var scents: [WineScent] = []
    var taste: [Double] = [0, 0, 0, 0, 0]
    var think: String = ""
    var rating: Double = 0.0
    
    static var shared = WineNoteObservable()
    
    func reset() {
        name = ""
        date = Date()
        type = wineTypes[2]
        image = nil
        color = wineColors[0]
        scents = []
        taste = [0, 0, 0, 0, 0]
        think = ""
        rating = 0.0
    }
}
