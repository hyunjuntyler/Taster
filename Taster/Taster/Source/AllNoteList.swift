//
//  ListSection.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import SwiftData
import SwiftUI

struct AllNoteList: View {
    @Query private var wineNotes: [SchemaV2.WineTastingNote]
    @Query private var coffeeNotes: [SchemaV2.CoffeeTastingNote]
    @Query private var whiskeyNotes: [SchemaV2.WhiskeyTastingNote]
    @Query private var cocktailNotes: [SchemaV2.CocktailTastingNote]
    
    var body: some View {
        List {
            NoteSection(title: "와인 노트", notes: wineNotes)
            NoteSection(title: "커피 노트", notes: coffeeNotes)
            NoteSection(title: "위스키 노트", notes: whiskeyNotes)
            NoteSection(title: "칵테일 노트", notes: cocktailNotes)
        }
        .listRowSpacing(8)
        .headerProminence(.increased)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu("노트 추가", systemImage: "plus") {
                    Button("와인", image: .wine) {
                        
                    }
                    
                    Button("커피", image: .coffee) {
                        
                    }
                    
                    Button("위스키", image: .whiskey) {
                        
                    }
                    
                    Button("칵테일", image: .cocktail) {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AllNoteList()
            .navigationTitle("노트")
    }
    .modelContainer(SchemaV2.previewContainer)
}
