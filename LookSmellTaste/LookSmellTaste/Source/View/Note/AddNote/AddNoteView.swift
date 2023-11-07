//
//  AddNoteView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @State var navigate = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appSheetBackground.ignoresSafeArea()
                VStack {
                    ScrollView {
                        Text("어떤 노트를 추가하고 싶으신가요?")
                            .font(.gmarketSansTitle3)
                            .padding(.bottom)
                        
                        HStack {
                            AddNoteButton(title: "와인", image: "garnetWine", selected: noteEnvironment.noteType == .wine) {
                                noteEnvironment.noteType = .wine
                            }
                            AddNoteButton(title: "커피", image: "coffee", selected: noteEnvironment.noteType == .coffee) {
                                noteEnvironment.noteType = .coffee
                            }
                            AddNoteButton(title: "칵테일", image: "cocktail", selected: noteEnvironment.noteType == .cocktail) {
                                noteEnvironment.noteType = .cocktail
                            }
                        }
                        .padding(.horizontal)
                    }
                    NextButton {
                        navigate = true
                    }
                    .navigationDestination(isPresented: $navigate) {
                        Text("next view")
                    }
                }
            }
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
        .tint(.clear)
    }
}

#Preview {
    AddNoteView()
        .environment(NoteEnvironment())
}
