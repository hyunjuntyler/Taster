//
//  ListSection.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import SwiftData
import SwiftUI

struct AllNoteList: View {
    @State private var text = ""

    @Query private var wineNotes: [WineTastingNote]
    @Query private var coffeeNotes: [CoffeeTastingNote]
    @Query private var whiskeyNotes: [WhiskeyTastingNote]
    @Query private var cocktailNotes: [CocktailTastingNote]
    
    private var isEmpty: Bool {
        wineNotes.isEmpty && coffeeNotes.isEmpty && whiskeyNotes.isEmpty && cocktailNotes.isEmpty
    }
    
    var body: some View {
        List {
            if isEmpty {
                ContentUnavailableView("기록이 없어요", systemImage: "questionmark.circle.fill", description: Text("나만의 노트를 추가해 보세요"))
            }
            
            NoteSection(title: "와인 노트", notes: wineNotes)
            NoteSection(title: "커피 노트", notes: coffeeNotes)
            NoteSection(title: "위스키 노트", notes: whiskeyNotes)
            NoteSection(title: "칵테일 노트", notes: cocktailNotes)
        }
        .listRowSpacing(8)
        .headerProminence(.increased)
        .searchable(text: $text)
        .navigationTitle("노트")
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
