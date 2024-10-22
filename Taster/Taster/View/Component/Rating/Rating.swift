//
//  Rating.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/12/23.
//

import SwiftUI

struct Rating: View {
    @Binding var rating: Double
    
    @State var scaleUpWhenDragged = false
    @State var scaleUpWhenTapped = false
    
    var systemName: String = "star.fill"
    var font: Font = .title
    var foregroundColor: Color = .yellow
    
    private let dragRange: CGFloat = 30
    
    private var roundedRating: Double {
        let boundedRating = min(max(rating, 0.0), 5.0)
        return (boundedRating * 2).rounded() / 2
    }
    
    var body: some View {
        Symbol(
            rating: $rating,
            scaleUpWhenDragged: $scaleUpWhenDragged,
            scaleUpWhenTapped: $scaleUpWhenTapped,
            systemName: systemName,
            font: font
        )
        .overlay(
            GeometryReader { geometry in
                Rectangle()
                    .foregroundStyle(foregroundColor)
                    .frame(width: CGFloat(roundedRating) / 5 * geometry.size.width)
                    .animation(nil, value: rating)
                    .allowsHitTesting(false)
            }.mask(
                Symbol(
                    rating: $rating,
                    scaleUpWhenDragged: $scaleUpWhenDragged,
                    scaleUpWhenTapped: $scaleUpWhenTapped,
                    systemName: systemName,
                    font: font
                )
            )
        )
    }
}

private struct Symbol: View {
    @Binding var rating: Double
    @Binding var scaleUpWhenDragged: Bool
    @Binding var scaleUpWhenTapped: Bool
    
    let systemName: String
    let font: Font
    
    private let dragRange: CGFloat = 30
    private let foregroundColor = Color(.systemGray5)
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(1..<6) { index in
                Image(systemName: systemName)
                    .font(font)
                    .fontWeight(.black)
                    .foregroundStyle(foregroundColor)
                    .scaleEffect(
                        rating >= Double(index) && scaleUpWhenTapped ||
                        rating + 1 > Double(index) && scaleUpWhenDragged ? 1.16 : 1)
                    .onTapGesture {
                        withAnimation {
                            if Double(index) == rating {
                                rating = Double(index - 1)
                            } else {
                                rating = Double(index)
                            }
                            scaleUpWhenTapped = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation {
                                    scaleUpWhenTapped = false
                                }
                            }
                        }
                    }
                    .simultaneousGesture(
                        DragGesture()
                            .onChanged { gesture in
                                withAnimation {
                                    let dragValue = gesture.location.x / dragRange
                                    let boundedRating = min(max(Double(index) - 0.5 + dragValue, 0.0), 5.0)
                                    rating = (boundedRating * 2).rounded() / 2
                                    scaleUpWhenDragged = true
                                }
                            }
                            .onEnded { _ in
                                withAnimation {
                                    scaleUpWhenDragged = false
                                }
                            }
                    )
            }
        }
        
    }
}

#Preview {
    Rating(rating: .constant(2.5))
}
