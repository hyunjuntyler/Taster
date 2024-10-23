//
//  NoteHeader.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import SwiftData
import SwiftUI

struct NoteHeader<T: TastingNote & Identifiable>: View {
    let title: String
    var notes: [T]
    
    var body: some View {
        HStack {
            Text(title)
            NavigationLink {
                NoteList(notes: notes, title: title)
            } label: {
                Image(systemName: "chevron.right")
                    .bold()
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    NavigationStack {
        NoteHeader(title: "와인 노트", notes: SchemaV2.wineTastingNotes)
    }
}
