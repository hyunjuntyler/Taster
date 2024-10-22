//
//  RatingDisplay.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI

struct RatingDisplay: View {
    enum LabelLocation {
        case left, right, none
    }
    
    var rating: Double
    var color: Color = .yellow
    var systemName = "star.fill"
    var font: Font = .caption
    var fontWeight: Font.Weight = .black
    var labelLocation: LabelLocation = .none
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 5) {
            if labelLocation == .left {
                Label(rating: rating, font: font)
            }
            
            Symbol(systemName: systemName, font: font, fontWeight: fontWeight)
            .overlay {
                GeometryReader { geometry in
                    let width = geometry.size.width
                    
                    Rectangle()
                        .foregroundStyle(color)
                        .frame(width: rating / 5 * width)
                }
                .mask(Symbol(systemName: systemName, font: font, fontWeight: fontWeight))
            }
            
            if labelLocation == .right {
                Label(rating: rating, font: font)
            }
        }
    }
}

private struct Symbol: View {
    let systemName: String
    let font: Font
    let fontWeight: Font.Weight
    var foregroundColor: Color = Color(.systemGray5)
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<5) { _ in
                Image(systemName: systemName)
                    .font(font)
                    .fontWeight(fontWeight)
                    .foregroundColor(foregroundColor)
            }
        }
    }
}

private struct Label: View {
    let rating: Double
    let font: Font
    
    var body: some View {
        Text("\(rating, specifier: "%.1f")")
            .monospacedDigit()
            .font(font)
            .fontWeight(.regular)
            .fontDesign(.rounded)
    }
}

#Preview {
    RatingDisplay(rating: 4.5, labelLocation: .right)
}
