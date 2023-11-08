//
//  AddNoteView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appSheetBackground.ignoresSafeArea()
                VStack {
                    ScrollView {
                        Text("어떤 노트를 추가하고 싶으신가요?")
                            .font(.gmarketSansTitle2)
                            .padding(.bottom)
                        
                        HStack {
                            AddNoteButton(title: "와인", image: "garnetWine", selected: noteEnvironment.noteType == .wine) {
                                noteEnvironment.checkType(type: .wine)
                            }
                            AddNoteButton(title: "커피", image: "coffee", selected: noteEnvironment.noteType == .coffee) {
                                noteEnvironment.checkType(type: .coffee)
                            }
                            AddNoteButton(title: "칵테일", image: "cocktail", selected: noteEnvironment.noteType == .cocktail) {
                                noteEnvironment.checkType(type: .cocktail)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Text("추가하고 싶은 노트를 선택해주세요")
                        .font(.gmarketSansCaption)
                        .foregroundStyle(.gray)
                        .transition(.opacity)
                        .opacity(noteEnvironment.noteType == nil ? 1 : 0)
                        .animation(.bouncy, value: noteEnvironment.noteType)
                        .padding(.bottom, 5)
                    
                    NextButton(disabled: noteEnvironment.noteType == nil) {
                        navigate = true
                    }
                    .navigationDestination(isPresented: $navigate) {
                        switch noteEnvironment.noteType {
                        case .wine:
                            AddWineInfoView()
                        case .coffee:
                            Text("coffee")
                        case .cocktail:
                            Text("cocktail")
                        case .none:
                            EmptyView()
                        }
                    }
                }
            }
            .navigationTitle("")
            .toolbar {
                CloseButton {
                    noteEnvironment.showAlert = true
                }
            }
        }
        .overlay {
            if noteEnvironment.showAlert {
                CloseAlert()
            }
        }
    }
}

#Preview {
    AddNoteView()
        .environment(NoteEnvironment())
}
