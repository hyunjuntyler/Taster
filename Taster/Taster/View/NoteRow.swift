//
//  NoteRow.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import SwiftUI

struct NoteRow<T: TastingNote>: View {
    var note: T
    
    var body: some View {
        NavigationLink {
            NoteDetail(note: note)
        } label: {
            HStack {
                Thumnail(
                    data: note.thumnail,
                    category: note.category,
                    width: 60,
                    height: 60,
                    uiColor: .systemGroupedBackground
                )
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("\(note.createdAt.formatted(date: .abbreviated, time: .omitted))")
                            .font(.caption2)
                        Text(note.title)
                            .bold()
                            .lineLimit(1)
                        RatingDisplay(rating: note.rating)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        List {
            NoteRow(note: SchemaV2.wineTastingNotes[0])
        }
    }
}
