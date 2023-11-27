//
//  NoteView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct NoteView: View {
    @Bindable private var noteEnvironment = NoteEnvironment()
    @State private var scrollOffset = 0.0
    
    var body: some View {
        ScrollView {
            Color.clear
                .frame(height: 0)
                .onScrollOffsetChanged { offset in
                    scrollOffset = offset
                }
            NavigationTitle(type: .note, scrollOffset: scrollOffset)
            ContentUnavailable(type: .note)
                .padding(.top, 250)
        }
        .coordinateSpace(name: "scroll")
        .overlay {
            InlineNavigationTitle(type: .note, scrollOffset: scrollOffset)
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
        .padding(20)
        .padding(.bottom, 10)
        .buttonStyle(PressButtonStyle())
    }
}

#Preview {
    ZStack {
        Color.appBackground.ignoresSafeArea()
        NoteView()
    }
    .ignoresSafeArea(edges: .bottom)
}
