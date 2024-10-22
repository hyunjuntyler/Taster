//
//  NoteList.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/22/24.
//

import SwiftData
import SwiftUI

struct NoteList<T: SchemaV2.TastingNote & Identifiable>: View {
    @Environment(\.modelContext) var context
    @State private var showDeleteAlert = false
    var notes: [T]
    let title: String
    
    var body: some View {
        List {
            ForEach(notes) { note in
                NoteRow(note: note)
                    .swipeActions {
                        Button("삭제", systemImage: "trash") {
                            showDeleteAlert = true
                        }
                        .tint(.red)
                    }
                    .alert("정말 삭제하시겠어요?", isPresented: $showDeleteAlert) {
                        Button("확인", role: .destructive) {
                            context.delete(note)
                        }
                    } message: {
                        Text("삭제한 노트는 복구가 불가능해요.")
                    }
            }
        }
        .listRowSpacing(8)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Menu("메뉴", systemImage: "ellipsis") {
                Menu("정렬", systemImage: "arrow.up.arrow.down") {
                    Button("최신 순") {
                        
                    }
                    
                    Button("옛날 순") {
                        
                    }
                    
                    Button("별점 순") {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        NoteList(notes: SchemaV2.wineTastingNotes, title: "와인 노트")
    }
}
