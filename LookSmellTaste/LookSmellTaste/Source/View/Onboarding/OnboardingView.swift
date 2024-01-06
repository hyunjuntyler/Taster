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
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
            
            VStack {
                VStack {
                    Image("AppIconImage")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                        )
                    Text("앱 시작하기")
                        .font(.gmarketSansTitle)
                        .padding(.vertical, 16)
                        .padding(.bottom)
                    VStack(alignment: .leading, spacing: 24) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 36))
                                .fontWeight(.semibold)
                                .foregroundStyle(.appBackground, .accent)
                                .frame(width: 40)
                            Text("플러스 버튼을 눌러\n노트를 추가해보세요")
                                .font(.gmarketSansBody)
                                .lineSpacing(5)
                        }
                        
                        HStack {
                            Text("📝")
                                .font(.tossFaceLarge)
                                .frame(width: 40)
                            Text("간단하게 나만의\n테이스팅 노트를 작성해보세요")
                                .font(.gmarketSansBody)
                                .lineSpacing(5)
                        }
                        
                        HStack {
                            Text("🧑‍🍳")
                                .font(.tossFaceLarge)
                                .frame(width: 40)
                            Text("다양한 종류의 노트를 작성하여\n맛잘알이 되어보세요")
                                .font(.gmarketSansBody)
                                .lineSpacing(5)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 40)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 60)
                
                NextButton(label: "계속") {
                    withAnimation {
                        onboarding = false
                    }
                }
                .padding(.bottom)
            }
        }
    }
}

#Preview("Korean") {
    OnboardingView()
        .environment(\.locale, .init(identifier: "ko"))
}

#Preview("English") {
    OnboardingView()
        .environment(\.locale, .init(identifier: "en"))
}
