//
//  AddWhiskeyNoteView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI

struct AddWhiskeyNoteView: View {
    @Bindable private var observable = WhiskeyNoteObservable.shared
    @State private var showDatePicker = false
    @State private var showWineTypePicker = false
    @FocusState private var isFocused
    
    @State private var name = ""
    @State private var date = Date()
    @State private var type: WhiskeyType?
    @State private var image: UIImage?
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    AddWhiskeyNoteView()
}
