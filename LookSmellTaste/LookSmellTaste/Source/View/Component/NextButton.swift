//
//  NextButton.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct NextButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("다음")
                .foregroundStyle(.background)
                .font(.gmarketSansButton)
                .frame(maxWidth: .infinity)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .foregroundStyle(.accent)
                }
                .padding(.horizontal)
                .padding(.bottom)
        }
        .buttonStyle(PressButtonStyle())
    }
}

#Preview {
    NextButton { 
        // action here
    }
}
