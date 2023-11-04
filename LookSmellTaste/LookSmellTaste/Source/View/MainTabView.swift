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
            Group {
                switch selectedTab {
                case .note:
                    NoteView()
                case .share:
                    ShareView()
                }
            }
            .contentMargins(.bottom, 80)
            .ignoresSafeArea(edges: .bottom)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            TabBar(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    MainTabView()
}
