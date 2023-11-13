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
    var noteLabel: String
    var noteImageName: String
    var noteType: NoteType
}

let notes: [Note] = [
    Note(noteLabel: "와인", noteImageName: "garnetWine", noteType: .wine),
    Note(noteLabel: "커피", noteImageName: "coffee", noteType: .coffee),
    Note(noteLabel: "칵테일", noteImageName: "cocktail", noteType: .cocktail),
    Note(noteLabel: "위스키", noteImageName: "whiskey", noteType: .whiskey)
]
