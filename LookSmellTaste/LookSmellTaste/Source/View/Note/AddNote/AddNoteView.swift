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
    @State private var scrollDisabled = true
    
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
                                AddNoteButton(title: note.label, image: note.imageName, selected: noteEnvironment.noteType == note.type) {
                                    withAnimation {
                                        noteEnvironment.selectType(type: note.type)
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
                                AddWineNoteView()
                            case .coffee:
                                AddCoffeeNoteView()
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
                    .scrollDisabled(scrollDisabled)
                    .onChange(of: noteEnvironment.isNotePreparing) { _, newValue in
                        if newValue {
                            scrollDisabled = newValue
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                scrollDisabled = newValue
                            }
                        }
                    }
                    
                    NextButton(disabled: noteEnvironment.isNotePreparing) {
                        navigate = true
                    }
                    .navigationDestination(isPresented: $navigate) {
                        switch noteEnvironment.noteType {
                        case .wine:
                            AddWineLookView()
                        case .coffee:
                            AddCoffeeFlavorView()
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
    }
}

#Preview {
    AddNoteView()
        .environment(NoteEnvironment())
}
