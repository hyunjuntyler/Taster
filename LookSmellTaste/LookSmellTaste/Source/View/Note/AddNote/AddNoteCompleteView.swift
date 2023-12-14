//
//  AddWineCompleteView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/12/23.
//

import SwiftUI
import SwiftData

struct AddNoteCompleteView: View {
    @Environment(\.modelContext) private var context
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    
    @Bindable private var wineNoteObservable = WineNoteObservable.shared
    @Bindable private var coffeeNoteObservable = CoffeeNoteObservable.shared
    @Bindable private var cocktailNoteObservable = CocktailNoteObservable.shared
    @Bindable private var whiskeyNoteObservable = WhiskeyNoteObservable.shared
    @Query private var users: [User]
    private var user: User? { users.first }
    
    @State var counter = 1
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()
            VStack {
                Text("🎉")
                    .font(.tossFaceXXLarge)
                    .padding(.bottom)
                Text("성공적으로 기록되었어요")
                    .font(.gmarketSansTitle2)
                    .overlay(confetti)
            }
            .padding(.bottom, 100)
        }
        .onDisappear {
            saveNote()
            reset()
        }
    }
    
    private var confetti: some View {
        Confetti(counter: $counter,
                 num: 150,
                 confettiSize: 6,
                 rainHeight: UIScreen.main.bounds.height,
                 openingAngle: .degrees(40),
                 closingAngle: .degrees(140),
                 radius: UIScreen.main.bounds.width,
                 repetitions: 0)
        .onAppear {
            counter += 1
        }
    }
    
    private func saveNote() {
        switch noteEnvironment.noteType {
        case .wine:
            saveWineNote()
        case .coffee:
            saveCoffeeNote()
        case .cocktail:
            saveCocktailNote()
        case .whiskey:
            saveWhiskeyNote()
        case .none:
            break
        }
    }
    
    private func saveWineNote() {
        let wineNote = WineNote(
            name: wineNoteObservable.name,
            date: wineNoteObservable.date,
            type: wineNoteObservable.type,
            color: wineNoteObservable.color,
            scents: wineNoteObservable.scents,
            taste: wineNoteObservable.taste,
            think: wineNoteObservable.think,
            rating: wineNoteObservable.rating
        )
        
        wineNote.user = user
        wineNote.image = wineNoteObservable.image
        
        user?.wineNotes?.append(wineNote)
        try? context.save()
    }
    
    private func saveCoffeeNote() {
        let coffeeNote = CoffeeNote(
            name: coffeeNoteObservable.name,
            date: coffeeNoteObservable.date,
            type: coffeeNoteObservable.type,
            flavors: coffeeNoteObservable.flavors,
            taste: coffeeNoteObservable.taste,
            think: coffeeNoteObservable.think,
            rating: coffeeNoteObservable.rating
        )
        
        coffeeNote.user = user
        coffeeNote.image = coffeeNoteObservable.image
        
        user?.coffeeNotes?.append(coffeeNote)
        try? context.save()
    }
    
    private func saveCocktailNote() {
        let cocktailNote = CocktailNote(
            name: cocktailNoteObservable.name,
            date: cocktailNoteObservable.date,
            type: cocktailNoteObservable.type,
            ingredients: cocktailNoteObservable.ingredients,
            isIce: cocktailNoteObservable.isIce,
            taste: cocktailNoteObservable.taste,
            think: cocktailNoteObservable.think,
            rating: cocktailNoteObservable.rating
        )
        
        cocktailNote.user = user
        cocktailNote.image = cocktailNoteObservable.image
        
        user?.cocktailNotes?.append(cocktailNote)
        try? context.save()
    }
    
    private func saveWhiskeyNote() {
        let whiskeyNote = WhiskeyNote(
            name: whiskeyNoteObservable.name,
            date: whiskeyNoteObservable.date,
            type: whiskeyNoteObservable.type, 
            color: whiskeyNoteObservable.color,
            flavors: whiskeyNoteObservable.flavors,
            taste: whiskeyNoteObservable.taste,
            think: whiskeyNoteObservable.think,
            rating: whiskeyNoteObservable.rating
        )
        
        whiskeyNote.user = user
        whiskeyNote.image = whiskeyNoteObservable.image
        
        user?.whiskeyNotes?.append(whiskeyNote)
        try? context.save()
    }
    
    private func reset() {
        wineNoteObservable.reset()
        coffeeNoteObservable.reset()
        cocktailNoteObservable.reset()
        whiskeyNoteObservable.reset()
        noteEnvironment.noteType = nil
    }
}

#if DEBUG
#Preview { @MainActor in
    AddNoteCompleteView()
        .modelContainer(previewContainer)
        .environment(NoteEnvironment())
}
#endif
