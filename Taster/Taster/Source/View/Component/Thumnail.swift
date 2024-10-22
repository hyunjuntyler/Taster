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
    let uiColor: UIColor
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .frame(width: width, height: height)
                .foregroundStyle(Color(uiColor))
            
            if let data = data, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
            } else if let category = SchemaV2StoredProperty.Category(rawValue: category) {
                Image(uiImage: category.uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: height / 6 * 4)
            }
        }
        .clipShape(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
        )
    }
}

#Preview {
    Thumnail(
        data: nil,
        category: "redWine",
        width: 60,
        height: 60,
        uiColor: .systemGray6
    )
}
