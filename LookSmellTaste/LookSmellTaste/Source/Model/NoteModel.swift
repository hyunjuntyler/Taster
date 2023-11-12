//
//  NoteModel.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/12/23.
//

import SwiftUI

struct Note: Identifiable {
    var id = UUID()
    var label: String
    var image: String
    var type: NoteType
}

let notes: [Note] = [
    Note(label: "와인", image: "garnetWine", type: .wine),
    Note(label: "커피", image: "coffee", type: .coffee),
    Note(label: "칵테일", image: "cocktail", type: .cocktail)
]
