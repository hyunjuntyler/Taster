//
//  WhiskeyNoteObservable.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI

@Observable
final class WhiskeyNoteObservable {
    var name: String = ""
    var date: Date = Date()
    var type: WhiskeyType = whiskeyTypes[0]
    var image: Data?
    var color: WhiskeyColor = whiskeyColors[0]
    var flavors: [WhiskeyFlavor] = []
    var taste: [Double] = [0, 0, 0, 0, 0]
    var think: String = ""
    var rating: Double = 0.0
    
    static var shared = WhiskeyNoteObservable()
    
    func reset() {
        name = ""
        date = Date()
        type = whiskeyTypes[0]
        image = nil
        color = whiskeyColors[0]
        flavors = []
        taste = [0, 0, 0, 0, 0]
        think = ""
        rating = 0.0
    }
}
