//
//  AddWhiskeySmellView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI

struct AddWhiskeySmellView: View {
    @Bindable private var observable = WineNoteObservable.shared
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    
    @State private var navigate = false
    @State private var scents: [WhiskeyScent] = []
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 5)
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    NavigationStack {
        AddWhiskeySmellView()
            .environment(NoteEnvironment())
    }
}
