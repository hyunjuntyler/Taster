//
//  NoteView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct NoteView: View {
    @State var scrollOffset = 0.0
    @State var addNote = false
    
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
                    }
                }
            Text("기록이 없어요")
                .font(.gmarketSansBody)
        }
        .coordinateSpace(name: "scroll")
        .overlay {
            InlineNavigationTitle(type: .note, scrollOffset: scrollOffset)
        }
        .overlay(alignment: .bottomTrailing) {
            Button {
                addNote = true
            } label: {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 45))
            }
            .padding(20)
        }
        .sheet(isPresented: $addNote) {
            AddNoteView()
                .interactiveDismissDisabled()
        }
    }
}

#Preview {
    MainTabView(selectedTab: .note)
}
