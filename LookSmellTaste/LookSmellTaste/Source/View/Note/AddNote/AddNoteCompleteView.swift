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
    @Bindable private var observable = WineNoteObservable.shared
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
        let wineNote = WineNote(name: observable.name, date: observable.date, type: observable.type, color: observable.color, scents: observable.scents, taste: observable.taste, think: observable.think, rating: observable.rating)
        
        wineNote.user = user
        wineNote.image = observable.image
        
        user?.wineNotes?.append(wineNote)
    }
}

#Preview {
    AddNoteCompleteView()
        .modelContainer(previewContainer)
}
