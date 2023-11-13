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
                    .font(.gmarketSansSubHeadline)
                    .foregroundStyle(selected ? .accent : .gray)
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .frame(height: 40)
            }
            .frame(maxWidth: .infinity)
            .padding(10)
            .background {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .foregroundStyle(selected ? .appPickerGray : .appSheetBoxBackground)
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
