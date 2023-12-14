//
//  AddWhiskeyTasteView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI

struct AddWhiskeyTasteView: View {
    @Bindable private var observable = WineNoteObservable.shared
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @State private var navigate = false
    
    @State private var taste: [Double] = [0, 0, 0, 0, 0]
    
    private let tasteLabels = ["바디", "당도", "산도", "타닌", "알코올"]
    private let symbolColors: [Color] = [.purple, .orange, .blue, .green, .red]
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    NavigationStack {
        AddWhiskeyTasteView()
            .environment(NoteEnvironment())
    }
}
