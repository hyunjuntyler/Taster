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
    
    // 새로운 값을 줘서 모양이나 드래그 정도 커스텀 가능
    var symbolName: String = "star.fill"
    var symbolFont: Font = .title
    var symbolColor: Color = .yellow
    var symbolBaseColor: Color = .appPickerGray
    
    var dragRange: CGFloat = 30
    
    var body: some View {
        starsView
            .overlay(
                overlayView
                    .mask(starsView)
            )
            .onChange(of: roundedRating) { oldRating, newRating in
                if (roundedRating == 0.0 || roundedRating == 5.0) && roundedRating != oldRating {
                    Haptic.impact(style: .light)
                } else if abs(newRating - oldRating) >= 0.5 {
                    Haptic.impact(style: .soft)
                }
            }
    }
    
    private var roundedRating: Double {
        let boundedRating = min(max(rating, 0.0), 5.0)
        return (boundedRating * 2).rounded() / 2
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            if roundedRating >= 0 && geometry.size.width.isNormal {
                Rectangle()
                    .foregroundStyle(symbolColor)
                    .frame(width: CGFloat(roundedRating) / 5 * geometry.size.width)
                    .animation(nil, value: rating)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack(spacing: 0) {
            ForEach(1..<6) { index in
                Image(systemName: symbolName)
                    .font(symbolFont)
                    .fontWeight(.black)
                    .foregroundStyle(symbolBaseColor)
                    .scaleEffect(
                        rating >= Double(index) && scaleUpWhenTapped ||
                        rating + 1 >= Double(index) && scaleUpWhenDragged ? 1.16 : 1)
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
                                    rating = min(max(Double(index) - 0.5 + dragValue, 0.0), 5.0)
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
