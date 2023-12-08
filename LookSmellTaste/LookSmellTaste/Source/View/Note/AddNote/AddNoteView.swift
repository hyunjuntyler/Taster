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
                        Text(noteEnvironment.isNotePreparing ? "어떤 노트를 추가하고 싶으신가요?" : "아래 간단한 정보를 입력해주세요")
                            .font(.gmarketSansBody)
                            .foregroundStyle(.gray)
                            .animation(nil, value: noteEnvironment.noteType)
                        
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(notes) { note in
                                AddNoteButton(title: note.noteLabel, image: note.noteImageName, selected: noteEnvironment.noteType == note.noteType) {
                                    Haptic.impact(style: .soft)
                                    withAnimation {
                                        noteEnvironment.selectType(type: note.noteType)
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
                        
                        Group {
                            switch noteEnvironment.noteType {
                            case .wine:
                                AddWineView()
                            case .coffee:
                                PreparingContent()
                            case .cocktail:
                                PreparingContent()
                            case .whiskey:
                                PreparingContent()
                            case .none:
                                EmptyView()
                            }
                        }
                        .transition(
                            .asymmetric(
                                insertion: .opacity.combined(with: .offset(y: 10)),
                                removal: .opacity.animation(nil)
                            )
                        )
                    }
                    .scrollDisabled(noteEnvironment.isNotePreparing)
                    
                    NextButton(disabled: noteEnvironment.isNotePreparing) {
                        Haptic.impact(style: .soft)
                        navigate = true
                    }
                    .navigationDestination(isPresented: $navigate) {
                        switch noteEnvironment.noteType {
                        case .wine:
                            AddWineLookView()
                        case .coffee:
                            EmptyView()
                        case .cocktail:
                            EmptyView()
                        case .whiskey:
                            EmptyView()
                        case .none:
                            EmptyView()
                        }
                    }
                }
            }
            .navigationTitle("")
            .toolbar {
                CloseButton {
                    if noteEnvironment.isNotePreparing {
                        noteEnvironment.addNote = false
                    } else {
                        noteEnvironment.showCloseAlert = true
                    }
                    Haptic.impact(style: .soft)
                }
            }
        }
        .overlay {
            if noteEnvironment.showCloseAlert {
                CloseAlert()
            }
        }
        .overlay {
            if noteEnvironment.showPermissionAlert {
                PermissionAlert()
            }
        }
        .overlay {
            if noteEnvironment.showCompleteView {
                AddNoteCompleteView()
                    .transition(.opacity.animation(.easeInOut(duration: 0.5)))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            noteEnvironment.addNote = false
                            noteEnvironment.showCompleteView = false
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
