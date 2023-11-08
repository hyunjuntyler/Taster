//
//  TabBar.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

enum Tab: String {
    case note
    case share
}

fileprivate let tabBarHeight: CGFloat = 80
fileprivate let imageHeight: CGFloat = 24
fileprivate let tabBarCornerRadius: CGFloat = 0
fileprivate let tabBarTopPadding: CGFloat = 5
fileprivate let tabBarComponentSpacing: CGFloat = 5

struct TabBar: View {
    @State var noteSymbolEffect = false
    @State var shareSymbolEffect = false
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack(spacing: 0) {
            Button {
                noteSymbolEffect.toggle()
                selectedTab = .note
                Haptic.impact(style: .soft)
            } label: {
                VStack(spacing: tabBarComponentSpacing) {
                    Image(systemName: "book.pages.fill")
                        .frame(height: imageHeight, alignment: .bottom)
                        .symbolEffect(.bounce, value: noteSymbolEffect)
                    Text("노트")
                        .font(.gmarketSansTab)
                }
                .padding(.top, tabBarTopPadding)
                .frame(maxWidth: .infinity)
                .foregroundColor(selectedTab == .note ? .accent : .gray)
            }
            .buttonStyle(TabButtonStyle())
            
            Button {
                shareSymbolEffect.toggle()
                selectedTab = .share
                Haptic.impact(style: .soft)
            } label: {
                VStack(spacing: tabBarComponentSpacing) {
                    Image(systemName: "person.2.fill")
                        .frame(height: imageHeight, alignment: .bottom)
                        .symbolEffect(.bounce, value: shareSymbolEffect)
                    Text("공유")
                        .font(.gmarketSansTab)
                }
                .padding(.top, tabBarTopPadding)
                .frame(maxWidth: .infinity)
                .foregroundColor(selectedTab == .share ? .accent : .gray)
            }
            .buttonStyle(TabButtonStyle())
        }
        .frame(height: tabBarHeight, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: tabBarCornerRadius, style: .continuous)
                .fill(.background)
        )
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.bouncy, value: configuration.isPressed)
    }
}

#Preview {
    MainTabView()
}
