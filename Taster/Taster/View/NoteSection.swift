//
//  NoteSection.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import SwiftUI

struct NoteSection<T: TastingNote>: View {
    @Environment(\.modelContext) var context
    
    @State private var showDeleteAlert = false
    @State private var selectedNote: T?
    
    let title: String
    var notes: [T]
    
    var body: some View {
        if !notes.isEmpty {
            Section {
                ForEach(notes.prefix(3)) { note in
                    NoteRow(note: note)
                        .swipeActions {
                            Button("삭제", systemImage: "trash") {
                                selectedNote = note
                                showDeleteAlert = true
                            }
                            .tint(.red)
                        }
                }
            } header: {
                NoteHeader(title: title, notes: notes)
            }
            .alert("정말 삭제하시겠어요?", isPresented: $showDeleteAlert) {
                Button("확인", role: .destructive) {
                    if let selectedNote {
                        context.delete(selectedNote)
                    }
                }
            } message: {
                Text("삭제한 노트는 복구가 불가능해요.")
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
