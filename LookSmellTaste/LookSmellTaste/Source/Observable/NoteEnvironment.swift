//
//  Note.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/6/23.
//

import SwiftUI

@Observable
class NoteEnvironment {
    var showSelectNoteType = false
    var showCompleteView = false
    var addNote = false
    var showCloseAlert = false
    var showPermissionAlert = false
    var noteType: NoteType?
    var permissionType: PermissionType?
    
    func close() {
        addNote = false
        showCloseAlert = false
        noteType = nil
    }
    
    func checkType(type: NoteType) {
        if noteType == type {
            noteType = nil
        } else {
            noteType = type
        }
    }
    
    func openAppSetting() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
