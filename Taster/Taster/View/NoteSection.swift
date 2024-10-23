//
//  NoteSection.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import SwiftUI
import SwiftData

struct NoteSection<T: TastingNote & Identifiable>: View {
    let title: String
    var notes: [T]
    
    var body: some View {
        if !notes.isEmpty {
            Section {
                ForEach(notes.prefix(3)) { note in
                    NoteRow(note: note)
                }
            } header: {
                NoteHeader(title: title, notes: notes)
            }
        }
    }
}

#Preview {
    NavigationStack {
        List {
            NoteSection(title: "와인 노트", notes: SchemaV2.wineTastingNotes)
        }
        .listRowSpacing(8)
        .headerProminence(.increased)
    }
}
