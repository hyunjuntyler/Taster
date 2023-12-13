//
//  RatingCircle.swift
//  LookSmellTaste
//
//  Created by hyunjun on 12/13/23.
//

import SwiftUI

struct RatingCircle: View {
    var rating: Double = 2.5
    var ratingColor: Color = .yellow
    var ratingSymbol = "circle.fill"
    
    var body: some View {
        HStack(spacing: 5) {
            Text("\(rating, specifier: "%.1f")")
                .monospacedDigit()
                .fontDesign(.rounded)
                .fontWeight(.semibold)
            
            starsView
                .overlay {
                    overlayView
                        .mask(starsView)
                }
        }
    }
    
    @ViewBuilder
    private var starsView: some View {

        HStack(spacing: 0) {
            ForEach(0..<5) { _ in
                Image(systemName: ratingSymbol)
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
    RatingCircle()
}
