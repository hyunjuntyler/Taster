//
//  NoteView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI
import SwiftData

struct NoteView: View {
    @Query(sort: \WineNote.date, order: .reverse) private var wineNotes: [WineNote]
    @Query(sort: \CoffeeNote.date, order: .reverse) private var coffeeNotes: [CoffeeNote]
    @Query(sort: \CocktailNote.date, order: .reverse) private var cocktailNotes: [CocktailNote]
    @Query(sort: \WhiskeyNote.date, order: .reverse) private var whiskeyNotes: [WhiskeyNote]

    @Query private var users: [User]
    private var user: User? { users.first }
    
    @State private var noteEnvironment = NoteEnvironment()
    @State private var scrollOffset = 0.0
    @Binding var navigateToUserView: Bool
    
    private var noteCount: Int {
        wineNotes.count + coffeeNotes.count + cocktailNotes.count + whiskeyNotes.count
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Color.clear
                        .frame(height: 0)
                        .onScrollOffsetChanged { offset in
                            scrollOffset = offset
                        }
                    
                    NavigationTitle(type: .note, scrollOffset: scrollOffset, navigateToUserView: $navigateToUserView)
                }
                
                if isNoteEmpty() {
                    ContentUnavailable(type: .note)
                        .padding(.top, 250)
                } else {
                    if let user = user {
                        HStack {
                            Text("👏")
                                .font(.tossFace(.large))
                            VStack(alignment: .leading) {
                                Group {
                                    Text("반가워요 ")
                                    + Text("\(user.name)")
                                        .foregroundStyle(.accent)
                                    + Text("님")
                                }
                                .font(.pretendard(.body))

                                Group {
                                    Text("총 ")
                                    + Text("\(noteCount)")
                                        .foregroundStyle(.accent)
                                    + Text("개의 노트를 작성하셨어요")
                                }
                                .font(.pretendard(.body))
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundStyle(.appSheetBoxBackground)
                        }
                        .padding(.horizontal)
                    }
                }
                
                if !wineNotes.isEmpty {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("와인 노트")
                                .font(.pretendard(.title2))
                            Spacer()
                            NavigationLink {
                                WineNoteView()
                            } label: {
                                Text("모두보기")
                                    .font(.pretendard(.body))
                            }
                        }
                        .padding(.horizontal, 5)
                        LazyVStack {
                            let recentWineNotes = wineNotes.prefix(3)
                            
                            ForEach(recentWineNotes) { note in
                                NavigationLink {
                                    WineNoteDetailView(note: note)
                                } label: {
                                    WineNoteList(note: note)
                                }
                                .buttonStyle(PressButtonStyle())
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
                
                if !coffeeNotes.isEmpty {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("커피 노트")
                                .font(.pretendard(.title2))
                            Spacer()
                            NavigationLink {
                                CoffeeNoteView()
                            } label: {
                                Text("모두보기")
                                    .font(.pretendard(.body))
                            }
                        }
                        .padding(.horizontal, 5)
                        LazyVStack {
                            let recentCoffeeNotes = coffeeNotes.prefix(3)
                            
                            ForEach(recentCoffeeNotes) { note in
                                NavigationLink {
                                    CoffeeNoteDetailView(note: note)
                                } label: {
                                    CoffeeNoteList(note: note)
                                }
                                .buttonStyle(PressButtonStyle())
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
                
                if !cocktailNotes.isEmpty {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("칵테일 노트")
                                .font(.pretendard(.title2))
                            Spacer()
                            NavigationLink {
                                CocktailNoteView()
                            } label: {
                                Text("모두보기")
                                    .font(.pretendard(.body))
                            }
                        }
                        .padding(.horizontal, 5)
                        LazyVStack {
                            let recentCoffeeNotes = cocktailNotes.prefix(3)
                            
                            ForEach(recentCoffeeNotes) { note in
                                NavigationLink {
                                    CocktailNoteDetailView(note: note)
                                } label: {
                                    CocktailNoteList(note: note)
                                }
                                .buttonStyle(PressButtonStyle())
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
                
                if !whiskeyNotes.isEmpty {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("위스키 노트")
                                .font(.pretendard(.title2))
                            Spacer()
                            NavigationLink {
                                WhiskeyNoteView()
                            } label: {
                                Text("모두보기")
                                    .font(.pretendard(.body))
                            }
                        }
                        .padding(.horizontal, 5)
                        LazyVStack {
                            let recentWhiskeyNotes = whiskeyNotes.prefix(3)
                            
                            ForEach(recentWhiskeyNotes) { note in
                                NavigationLink {
                                    WhiskeyNoteDetailView(note: note)
                                } label: {
                                    WhiskeyNoteList(note: note)
                                }
                                .buttonStyle(PressButtonStyle())
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
            }
            .padding(.bottom, 90)
        }
        .coordinateSpace(name: "scroll")
        .overlay {
            InlineNavigationTitle(type: .note, scrollOffset: scrollOffset, navigateToUserView: $navigateToUserView)
        }
        .overlay(alignment: .bottomTrailing) {
            addButton
        }
        .fullScreenCover(isPresented: $noteEnvironment.addNote) {
            AddNoteView()
                .interactiveDismissDisabled()
        }
        .overlay {
            if noteEnvironment.showCompleteView {
                AddNoteCompleteView()
                    .transition(.opacity.animation(.easeInOut(duration: 0.3)))
                    .onAppear {
                        noteEnvironment.addNote = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            noteEnvironment.showCompleteView = false
                        }
                    }
            }
        }
        .environment(noteEnvironment)
    }
    
    private var addButton: some View {
        Button {
            Haptic.impact(style: .light)
            noteEnvironment.addNote = true
        } label: {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 60))
                .foregroundStyle(.appBackground, .accent)
                .shadow(radius: 1)
        }
        .buttonStyle(PressButtonStyle())
        .background {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundStyle(.appBackground)
                .blur(radius: 8)
        }
        .padding(.trailing, 20)
    }
    
    private func isNoteEmpty() -> Bool {
        wineNotes.isEmpty && coffeeNotes.isEmpty && cocktailNotes.isEmpty && whiskeyNotes.isEmpty
    }
}

#if DEBUG
#Preview { @MainActor in
    NavigationStack {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            NoteView(navigateToUserView: .constant(false))
                .modelContainer(previewContainer)
        }
        .navigationTitle("")
    }
}
#endif
