//
//  WaveFilledGlassView.swift
//  Taster
//
//  Created by hyunjun on 10/7/24.
//

import SwiftUI

struct WaveFilledGlassView<Glass: Shape, Liquid: Shape>: View {
    @State private var phase1: CGFloat = .pi
    @State private var phase2: CGFloat = .zero
    
    @State var isAnimate: Bool
    
    let glass: Glass
    let liquid: Liquid
    let waveColor: Color
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                glass
                    .frame(width: 60, height: 90)
                    .foregroundStyle(.appGlass)
                ZStack {
                    WaveShape(amplitude: 3, frequency: 1, phase: phase1)
                        .frame(width: 55, height: 72)
                        .foregroundStyle(waveColor)
                    WaveShape(amplitude: 3, frequency: 1, phase: phase2)
                        .frame(width: 55, height: 72)
                        .foregroundStyle(waveColor.opacity(0.7))
                }
                .clipShape(liquid)
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
    WaveFilledGlassView(
        isAnimate: true,
        glass: Whiskey.GlassShape(),
        liquid: Whiskey.LiquidShape(),
        waveColor: .accent
    )
}
