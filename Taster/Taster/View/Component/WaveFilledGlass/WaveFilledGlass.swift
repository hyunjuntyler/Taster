//
//  WaveFilledGlassView.swift
//  Taster
//
//  Created by hyunjun on 10/7/24.
//

import SwiftUI

struct WaveFilledGlass: View {
    @State private var phase1: CGFloat = .pi
    @State private var phase2: CGFloat = .zero
    
    var isAnimate = false
    
    let width: CGFloat
    let height: CGFloat
    let category: Category
    let foregroundColor: Color
    
    enum Category {
        case wine, whiskey, cocktail
        
        var glass: AnyView {
            switch self {
            case .wine: AnyView(WineGlass())
            case .whiskey: AnyView(WhiskeyGlass())
            case .cocktail: AnyView(CocktailGlass())
            }
        }
        
        var liquid: AnyShape {
            switch self {
            case .wine: AnyShape(WineLiquid())
            case .whiskey: AnyShape(WhiskeyLiquid())
            case .cocktail: AnyShape(CocktailLiquid())
            }
        }
        
        var widthRatio: CGFloat {
            switch self {
            case .wine: 0.92
            case .whiskey: 0.9
            case .cocktail: 0.95
            }
        }
        
        var heightRatio: CGFloat {
            switch self {
            case .wine: 0.72
            case .whiskey: 0.8
            case .cocktail: 0.65
            }
        }
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                category.glass
                    .frame(width: width, height: height)
                    .foregroundStyle(.appGlass)
                Group {
                    Wave(amplitude: 3, frequency: 1, phase: phase1)
                        .foregroundStyle(foregroundColor)
                    Wave(amplitude: 3, frequency: 1, phase: phase2)
                        .foregroundStyle(foregroundColor.opacity(0.7))
                }
                .frame(
                    width: width * category.widthRatio,
                    height: height * category.heightRatio
                )
                .clipShape(category.liquid)
                .scaleEffect(0.8)
            }
            .onAppear {
                if isAnimate {
                    withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
                        phase1 += .pi * 2
                        phase2 += .pi * 4
                    }
                }
            }
        }
    }
}

#Preview {
    WaveFilledGlass(
        isAnimate: true,
        width: 60,
        height: 90,
        category: .whiskey,
        foregroundColor: .accent
    )
}
