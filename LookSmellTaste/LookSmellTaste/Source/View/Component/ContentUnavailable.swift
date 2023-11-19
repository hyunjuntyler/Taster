//
//  ContentUnavailable.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/7/23.
//

import SwiftUI

struct ContentUnavailable: View {
    var type: ViewType = .note
    
    var title: String {
        switch type {
        case .note:
            return "기록이 없어요"
        case .share:
            return "등록된 친구가 없어요"
        }
    }
    var description: String {
        switch type {
        case .note:
            return "나만의 노트를 추가해 보세요"
        case .share:
            return "친구를 추가해 노트를 공유해 보세요"
        }
    }
    
    var body: some View {
        VStack(spacing: 5) {
            switch type {
            case .note:
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundStyle(.accent, .yellow)
                    .symbolEffect(.pulse)
                    .font(.largeTitle)
                    .padding(.bottom)
            case .share:
                Image(systemName: "questionmark.circle.fill")
                    .foregroundStyle(.cocktail, .quaternary)
                    .symbolEffect(.pulse)
                    .font(.largeTitle)
                    .padding(.bottom)
            }
            Text(title)
                .font(.gmarketSansBody)
                .padding(.bottom, 5)
            Text(description)
                .font(.gmarketSansCaption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ContentUnavailable(type: .share)
}
