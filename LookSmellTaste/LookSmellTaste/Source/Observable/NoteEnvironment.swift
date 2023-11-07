//
//  Note.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/6/23.
//

import SwiftUI

enum NoteType {
    case wine
    case coffee
    case cocktail
}

@Observable
class NoteEnvironment {
    var addNote = false
    var showAlert = false
    var noteType: NoteType?
}
