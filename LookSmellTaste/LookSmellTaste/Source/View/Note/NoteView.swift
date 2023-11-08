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
            NavigationTitle(type: .note, scrollOffset: scrollOffset)
                .onScrollOffsetChanged { offset in
                    scrollOffset = offset
                }
                .overlay(alignment: .bottomTrailing) {
                    if scrollOffset > -15 {
                        Button {
                            
                        } label: {
                            Circle()
                                .foregroundStyle(.gray)
                                .frame(width: 28)
                                .padding(.trailing, 20)
                        }
                        .buttonStyle(PressButtonStyle())
                    }
                }
            ContentUnavailable(type: .note)
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
            noteEnvironment.addNote = true
        } label: {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 60))
                .foregroundStyle(.appBackground, .accent)
                .shadow(radius: 1)
        }
        .padding(20)
        .buttonStyle(PressButtonStyle())
    }
}

#Preview {
    MainTabView()
}
