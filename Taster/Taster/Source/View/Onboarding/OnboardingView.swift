//
//  OnboardingView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") private var onboarding = true
    
    var body: some View {
        VStack {
            VStack(spacing: 16) {
                Text("🥳")
                    .font(.tossFace(.extraLarge))
                HStack(spacing: 0) {
                    Text("테이스터")
                        .foregroundStyle(.accent)
                    Text("에 오신걸 환영해요")
                }
            }
            .padding(.top, 60)
            .padding(.bottom, 30)
            
            VStack(alignment: .leading, spacing: 24) {
                OnboardingCellView(emoji: "➕", text: "플러스 버튼을 눌러\n노트를 추가해보세요")
                OnboardingCellView(emoji: "📝", text: "간단하게 나만의\n테이스팅 노트를 작성해보세요")
                OnboardingCellView(emoji: "🧑‍🍳", text: "다양한 종류의 노트를 작성하여\n맛잘알이 되어보세요")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 40)
            .overlay {
                OnboardingConfettiView()
            }
        }
        .background(Color.appSheetBackground)
    }
}

#Preview {
    Text("Preview")
        .sheet(isPresented: .constant(true)) {
            OnboardingView()
        }
}
