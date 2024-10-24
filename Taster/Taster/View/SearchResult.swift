//
//  SearchResult.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/24/24.
//

import SwiftUI

struct SearchResult: View {
    var searchText: String = ""
    
    var wineNotes: [WineTastingNote]
    var coffeeNotes: [CoffeeTastingNote]
    var whiskeyNotes: [WhiskeyTastingNote]
    var cocktailNotes: [CocktailTastingNote]
    
    private var allNotes: [any TastingNote] {
        [
            wineNotes.map { $0 as any TastingNote },
            coffeeNotes.map { $0 as any TastingNote },
            whiskeyNotes.map { $0 as any TastingNote },
            cocktailNotes.map { $0 as any TastingNote }
        ]
        .flatMap { $0 }
        .filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        if allNotes.isEmpty {
            ContentUnavailableView(
                "'\(searchText)'에 대한 결과가 없어요",
                systemImage: "magnifyingglass",
                description: Text("맞춤법을 확인하거나 새로운 검색을 해보세요")
            )
        } else {
            ForEach(allNotes, id: \.id) { note in
                if let wineNote = note as? WineTastingNote {
                    NoteRow(note: wineNote)
                } else if let coffeeNote = note as? CoffeeTastingNote {
                    NoteRow(note: coffeeNote)
                } else if let whiskeyNote = note as? WhiskeyTastingNote {
                    NoteRow(note: whiskeyNote)
                } else if let cocktailNote = note as? CocktailTastingNote {
                    NoteRow(note: cocktailNote)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        List {
            SearchResult(
                searchText: "1",
                wineNotes: SchemaV2.wineTastingNotes,
                coffeeNotes: SchemaV2.coffeeTastingNotes,
                whiskeyNotes: SchemaV2.whiskeyTastingNotes,
                cocktailNotes: SchemaV2.cocktailTastingNotes
            )
        }
        .searchable(text: .constant("1"), isPresented: .constant(true))
    }
}
