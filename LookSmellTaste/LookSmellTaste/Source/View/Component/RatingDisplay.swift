//
//  RatingDisplay.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI

struct RatingDisplay: View {
    
    var rating: Double = 2.5
    var ratingColor: Color = .yellow
    var ratingSymbol = "star.fill"
    
    var body: some View {
        HStack(spacing: 5) {
            starsView
                .overlay {
                    overlayView
                        .mask(starsView)
                }
            Text("\(rating, specifier: "%.1f")")
                .monospacedDigit()
                .font(.gmarketSansCaption)
        }
    }
    
    @ViewBuilder
    private var starsView: some View {

        HStack(spacing: 0) {
            ForEach(0..<5) { _ in
                Image(systemName: ratingSymbol)
                    .font(.caption)
                    .fontWeight(.black)
                    .foregroundColor(Color(.systemGray5))
            }
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        GeometryReader { geometry in
            if rating >= 0 && geometry.size.width.isNormal {
                Rectangle()
                    .foregroundStyle(ratingColor)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
    }
}

#Preview {
    RatingDisplay()
}
