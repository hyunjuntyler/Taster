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
                 num: 80,
                 confettiSize: 8,
                 rainHeight: UIScreen.main.bounds.height,
                 openingAngle: .degrees(50),
                 closingAngle: .degrees(130),
                 radius: UIScreen.main.bounds.width,
                 repetitions: 1,
                 repetitionInterval: 0.5)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    counter += 1
                }
            }
    }
    
    private func saveNote() {
        switch noteEnvironment.noteType {
        case .wine:
            saveWineNote()
        case .coffee:
            saveCoffeeNote()
        case .cocktail:
            break
        case .whiskey:
            break
        case .none:
            break
        }
    }
    
    private func saveWineNote() {
        let wineNote = WineNote(name: wineNoteObservable.name, date: wineNoteObservable.date, type: wineNoteObservable.type, color: wineNoteObservable.color, scents: wineNoteObservable.scents, taste: wineNoteObservable.taste, think: wineNoteObservable.think, rating: wineNoteObservable.rating)
        
        wineNote.user = user
        wineNote.image = wineNoteObservable.image
        
        user?.wineNotes?.append(wineNote)
        try? context.save()
    }
    
    private func saveCoffeeNote() {
        let coffeeNote = CoffeeNote(name: coffeeNoteObservable.name, date: coffeeNoteObservable.date, type: coffeeNoteObservable.type, flavors: coffeeNoteObservable.flavors, taste: coffeeNoteObservable.taste, think: coffeeNoteObservable.think, rating: coffeeNoteObservable.rating)
        
        coffeeNote.user = user
        coffeeNote.image = coffeeNoteObservable.image
        
        user?.coffeeNotes?.append(coffeeNote)
        try? context.save()
    }
    
    private func reset() {
        wineNoteObservable.reset()
        
        noteEnvironment.noteType = nil
    }
}

#Preview {
    AddNoteCompleteView()
        .modelContainer(previewContainer)
        .environment(NoteEnvironment())
}
