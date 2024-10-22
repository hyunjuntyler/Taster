//
//  ContentView.swift
//  Taster
//
//  Created by hyunjun on 11/5/23.
//

import SwiftData
import SwiftUI

struct Content: View {
    @State private var text = ""
    
    var body: some View {
        NavigationStack {
            AllNoteList()
            .searchable(text: $text)
            .navigationTitle("노트")
        }
    }
}

#Preview {
    Content()
        .modelContainer(SchemaV2.previewContainer)
}
