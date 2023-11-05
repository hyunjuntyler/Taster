//
//  ShareView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct ShareView: View {
    @State var scrollOffset = 0.0

    var body: some View {
        ScrollView {
            NavigationTitle(type: .share, scrollOffset: scrollOffset)
                .onScrollOffsetChanged { offset in
                    scrollOffset = offset
                }
                .overlay(alignment: .bottomTrailing) {
                    if scrollOffset > -15 {
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .font(.system(size: 20))
                                .foregroundStyle(.gray)
                                .padding(.trailing, 20)
                        }
                    }
                }
            Text("공유 뷰")
        }
        .coordinateSpace(name: "scroll")
        .overlay {
            InlineNavigationTitle(type: .share, scrollOffset: scrollOffset)
        }
    }
}

#Preview {
    MainTabView(selectedTab: .share)
}