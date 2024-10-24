//
//  CustomCocktail.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/12/23.
//

import SwiftUI

struct CustomCocktail: View {
    var ingredients: [Ingredient]
    var isContainsIce: Bool
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        VStack {
            Glass(width: width, height: height)
                .overlay(alignment: .bottom) {
                    Liquid(ingredients: ingredients, width: width, height: height)
                        .scaleEffect(0.85)
                    Ice(isContainsIce: isContainsIce, width: width, height: height)
                }
                .padding(.vertical, 8)
            
            Ingredients(ingredients: ingredients)
        }
    }
}

private struct Glass: View {
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                Ellipse()
                    .frame(width: width, height: height * 0.3)
                    .offset(y: height * 0.15)
                    .zIndex(1)
                    .foregroundStyle(.appGlass)
                    .brightness(0.1)
                Rectangle()
                    .frame(width: width, height: height)
                    .foregroundStyle(.appGlass)
                Ellipse()
                    .frame(width: width, height: height * 0.3)
                    .offset(y: -height * 0.15)
                    .foregroundStyle(.appGlass)
            }
            
            Ellipse()
                .strokeBorder(lineWidth: 4)
                .frame(width: width, height: height * 0.3)
                .offset(y: height * 0.15)
                .zIndex(1)
                .foregroundStyle(.appGlass)
        }
        .frame(width: width, height: height * 1.3)
    }
}

private struct Liquid: View {
    var ingredients: [Ingredient]
    let width: CGFloat
    let height: CGFloat
    
    private var cocktailHeight: CGFloat { height * 0.7 }
    private var totalAmount: Double {
        ingredients.reduce(0) { $0 + $1.amount }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                ForEach(ingredients, id: \.self) { ingredient in
                    let height = cocktailHeight * ingredient.amount / totalAmount
                    if let color = color(from: ingredient) {
                        Rectangle()
                            .frame(width: width, height: height)
                            .foregroundStyle(color)
                    }
                }
            }
            
            ZStack {
                ForEach(ingredients.indices, id: \.self) { index in
                    let accumulatedHeight = ingredients[0..<index].reduce(0) { $0 + cocktailHeight * $1.amount / totalAmount }
                    let ingredient = ingredients[index]
                    let calculatedheight = cocktailHeight * ingredient.amount / totalAmount + accumulatedHeight
                    
                    if let color = color(from: ingredient) {
                        Ellipse()
                            .frame(width: width, height: height * 0.3)
                            .foregroundStyle(color)
                            .offset(y: calculatedheight)
                            .zIndex(Double(ingredients.count - index))
                    }
                }
            }
            .offset(y: -height * 0.15)
            
            if let ingredient = ingredients.first {
                if let color = color(from: ingredient) {
                    Ellipse()
                        .frame(width: width, height: height * 0.3)
                        .foregroundStyle(color)
                        .offset(y: -height * 0.15)
                        .brightness(0.1)
                        .grayscale(0.2)
                }
            }
        }
        .frame(width: width, height: cocktailHeight + height * 0.3)
    }
    
    private func color(from ingredient: Ingredient) -> Color? {
        IngredientColor(rawValue: ingredient.colorString)?.color
    }
}

private struct Ingredients: View {
    var ingredients: [Ingredient]
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 4)
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(ingredients, id: \.self) { ingredient in
                if let color = IngredientColor(rawValue: ingredient.colorString)?.color {
                    HStack {
                        RoundedRectangle(cornerRadius: 2, style: .continuous)
                            .frame(width: 10, height: 10)
                            .foregroundStyle(color)
                        Text(ingredient.name)
                            .font(.caption)
                    }
                }
            }
        }
    }
}

private struct Ice: View {
    var isContainsIce: Bool
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack {
            Text("🧊")
                .rotationEffect(.degrees(10))
            Text("🧊")
                .offset(x: width * 0.15)
                .rotationEffect(.degrees(-5))
            Text("🧊")
                .offset(x: -width * 0.15)
                .rotationEffect(.degrees(20))
        }
        .offset(y: height * 0.05)
        .font(.TossFace.body)
        .opacity(isContainsIce ? 0.4 : 0)
    }
}

#Preview {
    List {
        ZStack {
            CustomCocktail(ingredients: [
                Ingredient(name: "와인", amount: 1, colorString: "blue"),
                Ingredient(name: "커피", amount: 2, colorString: "red"),
                Ingredient(name: "칵테일", amount: 3, colorString: "green"),
                Ingredient(name: "위스키", amount: 2, colorString: "orange"),
                Ingredient(name: "자유", amount: 5, colorString: "yellow")
            ], isContainsIce: true, width: 60, height: 90)
        }
    }
}
