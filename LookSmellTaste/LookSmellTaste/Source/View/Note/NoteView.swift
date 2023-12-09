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
    @Query private var users: [User]
    private var user: User? { users.first }
    
    @Bindable private var noteEnvironment = NoteEnvironment()
    @State private var scrollOffset = 0.0
    @Binding var navigateToUserView: Bool
    
    private var noteCount: Int {
        wineNotes.count
    }
    
    var body: some View {
        ScrollView {
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
                            .font(.tossFaceXLarge)
                        VStack(alignment: .leading) {
                            Group {
                                Text("반가워요 ")
                                + Text("\(user.name)")
                                    .foregroundStyle(.accent)
                                + Text("님")
                            }
                            .font(.gmarketSansBody)
                            
                            Group {
                                Text("총 ")
                                + Text("\(noteCount)")
                                    .foregroundStyle(.accent)
                                + Text("개의 노트를 작성하셨어요")
                            }
                            .font(.gmarketSansBody)
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
                            .font(.gmarketSansTitle2)
                        Spacer()
                        NavigationLink {
                            WineNoteView()
                        } label: {
                            Text("모두보기")
                                .font(.gmarketSansBody)
                        }
                    }
                    .padding(.horizontal, 5)
                    LazyVStack {
                        let recentWineNotes = wineNotes.prefix(3)
                        
                        ForEach(recentWineNotes) { note in
                            NavigationLink {
                                WineNoteDetailView()
                            } label: {
                                HStack {
                                    if let data = note.image {
                                        if let image = UIImage(data: data) {
                                            Image(uiImage: image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 60, height: 60)
                                                .clipShape(
                                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                                )
                                        }
                                    } else {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                                .frame(width: 60, height: 60)
                                                .foregroundStyle(.appPickerGray)
                                            Image(note.type.typeImageName)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 40)
                                        }
                                    }
                                    
                                    Text(note.name)
                                        .font(.gmarketSansBody)
                                }
                                .padding(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background {
                                    RoundedRectangle(cornerRadius: 16)
                                        .foregroundStyle(.appSheetBoxBackground)
                                }
                            }
                            .buttonStyle(PressButtonStyle())
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)
            }
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
        .padding(.trailing, 20)
        .buttonStyle(PressButtonStyle())
    }
    
    private func isNoteEmpty() -> Bool {
        wineNotes.isEmpty
    }
}

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
