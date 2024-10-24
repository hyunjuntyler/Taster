//
//  Thumnail.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/22/24.
//

import SwiftUI

struct Thumnail: View {
    let data: Data?
    let category: String
    let width: CGFloat
    let height: CGFloat
    
    var foregroundStyle: some ShapeStyle = .ultraThinMaterial
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: width, height: height)
                .foregroundStyle(foregroundStyle)

            if let data = data, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
            } else if let category = Category(rawValue: category) {
                Image(uiImage: category.uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: height / 6 * 4)
            }
        }
        .clipShape(
            RoundedRectangle(cornerRadius: height * 0.2, style: .continuous)
        )
    }
}

#Preview {
    Thumnail(
        data: nil,
        category: "redWine",
        width: 60,
        height: 60
    )
}
