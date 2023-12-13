//
//  Note.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/6/23.
//

import SwiftUI

@Observable
final class NoteEnvironment {
    var addNote = false
    var isNotePreparing = true
    var showCloseAlert = false
    var showPermissionAlert = false
    var showCompleteView = false
    var noteType: NoteType?
    var permissionType: PermissionType?
    
    func close() {
        addNote = false
        showCloseAlert = false
        isNotePreparing = true
        noteType = nil
    }
    
    func selectType(type: NoteType) {
        if noteType == type {
            noteType = nil
            checkNotePreparing()
        } else {
            noteType = type
            checkNotePreparing()
        }
    }
    
    func openAppSetting() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    private func checkNotePreparing() {
        switch noteType {
        case .wine:
            isNotePreparing = false
        case .coffee:
            isNotePreparing = false
        case .cocktail:
            isNotePreparing = false
        case .whiskey:
            isNotePreparing = true
        case nil:
            isNotePreparing = true
        }
    }
}
