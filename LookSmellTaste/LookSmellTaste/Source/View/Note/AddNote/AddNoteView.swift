//
//  AddNoteView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @State private var columns = Array(repeating: GridItem(.flexible()), count: 4)
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appSheetBackground.ignoresSafeArea()
                VStack {
                    ScrollView {
                        Text("Add note")
                            .font(.gmarketSansTitle)
                            .padding(.bottom)
                        Text(noteEnvironment.noteType == .none ? "어떤 노트를 추가하고 싶으신가요?" : "아래 간단한 정보를 입력해주세요")
                            .font(.gmarketSansBody)
                            .foregroundStyle(.gray)
                            .animation(nil, value: noteEnvironment.noteType)
                        
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(notes) { note in
                                AddNoteButton(title: note.noteLabel, image: note.noteImageName, selected: noteEnvironment.noteType == note.noteType) {
                                    Haptic.impact(style: .soft)
                                    withAnimation {
                                        noteEnvironment.checkType(type: note.noteType)
                                    }
                                }
                            }
                        }
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.appSheetBoxBackground)
                        }
                        .padding()
                        
                        if noteEnvironment.noteType == .wine {
                            AddWineView()
                                .transition(.opacity.combined(with: .offset(y : 5)))
                        }
                    }
                    
                    NextButton(disabled: noteEnvironment.noteType == .none) {
                        Haptic.impact(style: .soft)
                        navigate = true
                    }
                    .navigationDestination(isPresented: $navigate) {
                        switch noteEnvironment.noteType {
                        case .wine:
                            AddWineLookView()
                        case .coffee:
                            Text("coffee")
                        case .cocktail:
                            Text("cocktail")
                        case .whiskey:
                            Text("whiskey")
                        case .none:
                            EmptyView()
                        }
                    }
                }
            }
            .navigationTitle("")
            .toolbar {
                CloseButton {
                    if noteEnvironment.noteType == .none {
                        noteEnvironment.addNote = false
                    } else {
                        noteEnvironment.showAlert = true
                    }
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
