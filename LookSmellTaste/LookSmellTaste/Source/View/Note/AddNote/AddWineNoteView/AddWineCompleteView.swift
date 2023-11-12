//
//  AddWineCompleteView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/12/23.
//

import SwiftUI

struct AddWineCompleteView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()
            VStack {
                Text("🎉")
                    .font(.tossFaceLarge)
                    .padding(.bottom)
                Text("성공적으로 기록되었어요")
                    .font(.gmarketSansTitle2)
            }
            .padding(.bottom, 100)
        }
    }
}

#Preview {
    AddWineCompleteView()
}
