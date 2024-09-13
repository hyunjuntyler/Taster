//
//  NoteModel.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/12/23.
//

import SwiftUI

enum NoteType {
    case wine
    case coffee
    case cocktail
    case whiskey
}

struct Note: Identifiable, Hashable {
    var id = UUID()
    var label: String
    var imageName: String
    var type: NoteType
}

let notes: [Note] = [
    Note(label: "와인", imageName: "garnetWine", type: .wine),
    Note(label: "커피", imageName: "coffee", type: .coffee),
    Note(label: "칵테일", imageName: "cocktail", type: .cocktail),
    Note(label: "위스키", imageName: "whiskey", type: .whiskey)
]
