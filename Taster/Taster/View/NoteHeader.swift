//
//  NoteHeader.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import SwiftUI

struct NoteHeader<T: TastingNote>: View {
    let title: String
    var notes: [T]
    
    var body: some View {
        NavigationLink {
            NoteList(notes: notes, title: title)
        } label: {
            HStack {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Image(systemName: "chevron.right")
                    .bold()
                    .foregroundStyle(.gray)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        NoteHeader(title: "와인 노트", notes: SchemaV2.wineTastingNotes)
    }
}
