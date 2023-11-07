//
//  AddNoteButton.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/7/23.
//

import SwiftUI

struct AddNoteButton: View {
    var title: String
    var image: String
    var selected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Text(title)
                    .font(.gmarketSansBody)
                    .foregroundStyle(selected ? .white : .primary)
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                    .frame(height: 50)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .foregroundStyle(selected ? .accent.opacity(0.8) : .appSheetBoxBackground)
            }
            .animation(.easeInOut, value: selected)
        }
        .buttonStyle(PressButtonStyle())
    }
}

#Preview {
    ZStack {
        Color.appSheetBackground.ignoresSafeArea()
        
        AddNoteButton(title: "와인", image: "garnetWine", selected: true) {
            // action here
        }
    }
}
