//
//  NoteView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI
import SwiftData

struct NoteView: View {
    @Query private var wineNotes: [WineNote]
    @Bindable private var noteEnvironment = NoteEnvironment()
    @State private var scrollOffset = 0.0
    @Binding var navigateToUserView: Bool
    
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
            }
            
            if !wineNotes.isEmpty {
                Text("와인 노트")
                ForEach(wineNotes) { note in
                    if let data = note.image {
                        if let image = UIImage(data: data) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                )
                        }
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .frame(width: 80, height: 80)
                                .foregroundStyle(.appPickerGray)
                            Image(note.type.typeImageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 60)
                        }
                    }
                }
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
    ZStack {
        Color.appBackground.ignoresSafeArea()
        NoteView(navigateToUserView: .constant(false))
            .modelContainer(previewContainer)
    }
}
