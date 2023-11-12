//
//  AddNoteView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @State private var columns = Array(repeating: GridItem(.flexible()), count: 3)
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appSheetBackground.ignoresSafeArea()
                VStack {
                    ScrollView {
                        Text("Start")
                            .font(.gmarketSansTitle)
                            .padding(.bottom)
                        Text("어떤 노트를 추가하고 싶으신가요?")
                            .font(.gmarketSansBody)
                            .foregroundStyle(.gray)
                            .padding(.bottom)
                        
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(notes) { note in
                                AddNoteButton(title: note.noteLabel, image: note.noteImageName, selected: noteEnvironment.noteType == note.noteType) {
                                    Haptic.impact(style: .soft)
                                    noteEnvironment.checkType(type: note.noteType)
                                }
                            }
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.appSheetBoxBackground)
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
                        Haptic.impact(style: .soft)
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
                    Haptic.impact(style: .soft)
                }
            }
        }
        .overlay {
            if noteEnvironment.showAlert {
                CloseAlert()
            }
        }
        .overlay {
            if noteEnvironment.showCompleteView {
                AddWineCompleteView()
                    .transition(.opacity.animation(.bouncy(duration: 2)))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            noteEnvironment.showCompleteView = false
                            noteEnvironment.addNote = false
                        }
                    }
            }
        }
    }
}

#Preview {
    AddNoteView()
        .environment(NoteEnvironment())
}
