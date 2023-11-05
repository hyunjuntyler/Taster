//
//  MainTabView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedTab: Tab = .note

    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            VStack(spacing: 0) {
                Group {
                    switch selectedTab {
                    case .note:
                        NoteView()
                    case .share:
                        ShareView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                TabBar(selectedTab: $selectedTab)
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    MainTabView()
}
