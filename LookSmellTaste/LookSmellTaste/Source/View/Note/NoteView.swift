//
//  NoteView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct NoteView: View {
    @State var scrollOffset = 0.0
    
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
            Text("노트 뷰")
        }
        .coordinateSpace(name: "scroll")
        .overlay {
            InlineNavigationTitle(type: .note, scrollOffset: scrollOffset)
        }
    }
}

#Preview {
    MainTabView(selectedTab: .note)
}
