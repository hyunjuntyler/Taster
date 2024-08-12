//
//  OnboardingCellView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 8/12/24.
//

import SwiftUI

struct OnboardingCellView: View {
    let emoji: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Text(emoji)
                .font(.tossFace(.medium))
            Text(text)
                .font(.pretendard(.body))
        }
    }
}

#Preview {
    OnboardingCellView(emoji: "🤔", text: "Preview")
}
