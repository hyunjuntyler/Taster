//
//  ListSection.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import SwiftData
import SwiftUI

struct AllNoteList: View {    
    @Query private var wineNotes: [WineTastingNote]
    @Query private var coffeeNotes: [CoffeeTastingNote]
    @Query private var whiskeyNotes: [WhiskeyTastingNote]
    @Query private var cocktailNotes: [CocktailTastingNote]
    
    @State private var searchText = ""
    @State private var selectedCategory: NoteCategory?
    @State private var showEditNote = false
    
    private var isEmpty: Bool {
        wineNotes.isEmpty && coffeeNotes.isEmpty && whiskeyNotes.isEmpty && cocktailNotes.isEmpty
    }
    
    var body: some View {
        List {
            if searchText.isEmpty {
                if isEmpty {
                    ContentUnavailableView("기록이 없어요", systemImage: "questionmark.circle.fill", description: Text("나만의 노트를 추가해 보세요"))
                }
                
                NoteSection(title: "와인 노트", notes: wineNotes)
                NoteSection(title: "커피 노트", notes: coffeeNotes)
                NoteSection(title: "위스키 노트", notes: whiskeyNotes)
                NoteSection(title: "칵테일 노트", notes: cocktailNotes)
            } else {
                SearchResult(
                    searchText: searchText,
                    wineNotes: wineNotes,
                    coffeeNotes: coffeeNotes,
                    whiskeyNotes: whiskeyNotes,
                    cocktailNotes: cocktailNotes
                )
            }
        }
        .searchable(text: $searchText)
        .listRowSpacing(8)
        .headerProminence(.increased)
        .navigationTitle("노트")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu("노트 추가", systemImage: "plus") {
                    ForEach(NoteCategory.allCases) { category in
                        Button(category.description, image: category.imageResource) {
                            selectedCategory = category
                        }
                    }
                }
            }
        }
        .sheet(item: $selectedCategory) { category in
            category.editNoteView
        }
    }
}

#Preview {
    NavigationStack {
        AllNoteList()
            .navigationTitle("노트")
    }
    .modelContainer(SchemaV2.sample)
}
