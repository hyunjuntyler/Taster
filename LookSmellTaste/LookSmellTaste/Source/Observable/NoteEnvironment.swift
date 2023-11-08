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
    var showSelectNoteType = false
    var addNote = false
    var showAlert = false
    var noteType: NoteType?
    
    func close() {
        addNote = false
        showAlert = false
        noteType = nil
    }
    
    func checkType(type: NoteType) {
        if noteType == type {
            noteType = nil
        } else {
            noteType = type
        }
    }
}
