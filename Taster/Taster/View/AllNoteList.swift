//
//  ListSection.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import SwiftData
import SwiftUI

struct AllNoteList: View {
    @State private var searchText = ""
    
    @Query private var wineNotes: [WineTastingNote]
    @Query private var coffeeNotes: [CoffeeTastingNote]
    @Query private var whiskeyNotes: [WhiskeyTastingNote]
    @Query private var cocktailNotes: [CocktailTastingNote]
    
    @State private var selectedCategory: NoteCategory?
    @State private var showEditNote = false
    
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
        .searchable(text: $searchText)
        .navigationTitle("노트")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu("노트 추가", systemImage: "plus") {
                    ForEach(NoteCategory.allCases, id: \.self) { category in
                        Button(category.description, image: category.imageResource) {
                            selectedCategory = category
                        }
                    }
                }
            }
        }
        .onChange(of: selectedCategory) { _, _ in
            showEditNote = true
        }
        .sheet(isPresented: $showEditNote) {
            if let category = selectedCategory {
                category.editNoteView
            }
        }
    }
}

enum NoteCategory: String, CaseIterable {
    case wine, coffee, whiskey, cocktail
    
    var description: String {
        switch self {
        case .wine: "와인"
        case .coffee: "커피"
        case .whiskey: "위스키"
        case .cocktail: "칵테일"
        }
    }
    
    var imageSuffix: String {
        switch self {
        case .wine: "Wine"
        case .coffee: "Coffee"
        case .whiskey: "Whiskey"
        case .cocktail: "Cocktail"
        }
    }
    
    var imageResource: ImageResource {
        switch self {
        case .wine: .wine
        case .coffee: .coffee
        case .whiskey: .whiskey
        case .cocktail: .cocktail
        }
    }
    
    var model: any PersistentModel {
        switch self {
        case .wine: WineTastingNote()
        case .coffee: CoffeeTastingNote()
        case .whiskey: WhiskeyTastingNote()
        case .cocktail: CocktailTastingNote()
        }
    }
    
    var categories: [Category] {
        switch self {
        case .wine: Wine.categories
        case .coffee: Coffee.categories
        case .whiskey: Whiskey.categories
        case .cocktail: Cocktail.categories
        }
    }
    
    var looks: [Look] {
        switch self {
        case .wine: Wine.looks
        case .coffee: []
        case .whiskey: Whiskey.looks
        case .cocktail: []
        }
    }
    
    var smells: [Smell] {
        switch self {
        case .wine: Wine.smells
        case .coffee: Coffee.smells
        case .whiskey: Whiskey.smells
        case .cocktail: []
        }
    }
    
    var tastes: [Taste] {
        switch self {
        case .wine: Wine.labels.map { Taste(label: $0, value: 0) }
        case .coffee: Coffee.labels.map { Taste(label: $0, value: 0) }
        case .whiskey: Whiskey.labels.map { Taste(label: $0, value: 0) }
        case .cocktail: Cocktail.labels.map { Taste(label: $0, value: 0) }
        }
    }
    
    @MainActor
    var editNoteView: AnyView {
        switch self {
        case .wine: AnyView(EditNote<WineTastingNote>(category: self))
        case .coffee: AnyView(EditNote<CoffeeTastingNote>(category: self))
        case .whiskey: AnyView(EditNote<WhiskeyTastingNote>(category: self))
        case .cocktail: AnyView(EditNote<CocktailTastingNote>(category: self))
        }
    }
    
    static func getCategory(from model: any PersistentModel) -> NoteCategory {
        if model is WineTastingNote {
            return .wine
        } else if model is CoffeeTastingNote {
            return .coffee
        } else if model is WhiskeyTastingNote {
            return .whiskey
        } else if model is CocktailTastingNote {
            return .cocktail
        }
        
        fatalError("Unknown PersistentModel type")
    }
}

#Preview {
    NavigationStack {
        AllNoteList()
            .navigationTitle("노트")
    }
    .modelContainer(SchemaV2.sample)
}
