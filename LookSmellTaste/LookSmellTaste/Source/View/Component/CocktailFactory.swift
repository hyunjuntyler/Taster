//
//  CocktailFactory.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/12/23.
//

import SwiftUI

struct CocktailFactory: View {
    var ingredients: [CocktailIngredient]
    var isIce: Bool
    var totalAmount: Double {
        ingredients.reduce(0) { $0 + $1.amount }
    }
    
    var body: some View {
        ZStack {
            ZStack {
                glass
                if !ingredients.isEmpty {
                    cocktail
                }
                if isIce {
                    ice
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
            cocktailIngredients
        }
    }
    
    private var cocktail: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                ForEach(ingredients) { ingredient in
                    let height = CGFloat(70 * ingredient.amount / totalAmount)
                    
                    Rectangle()
                        .frame(width: 60, height: height)
                        .foregroundStyle(getColor(for: ingredient.colorName))
                }
            }
            
            ZStack {
                ForEach(ingredients.indices, id: \.self) { index in
                    let accumulatedHeight = ingredients[0..<index].reduce(0) { $0 + CGFloat(70 * $1.amount / totalAmount) }
                    let ingredient = ingredients[index]
                    let height = CGFloat(70 * ingredient.amount / totalAmount) + accumulatedHeight
                    
                    Ellipse()
                        .frame(width: 60, height: 24)
                        .foregroundStyle(getColor(for: ingredient.colorName))
                        .offset(y: height)
                        .zIndex(Double(ingredients.count-index))
                }
            }
            .offset(y: -12)
            
            if let ingredient = ingredients.first {
                Ellipse()
                    .frame(width: 60, height: 24)
                    .foregroundStyle(getColor(for: ingredient.colorName))
                    .offset(y: -12)
                    .brightness(0.1)
                    .grayscale(0.2)
            }
        }
        .offset(y: 12)
    }
    
    private var cocktailIngredients: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(ingredients) { ingredient in
                    HStack {
                        RoundedRectangle(cornerRadius: 2, style: .continuous)
                            .frame(width: 10, height: 10)
                            .foregroundStyle(getColor(for: ingredient.colorName))
                        Text(ingredient.name)
                            .font(.pretendard(.caption))
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(width: 100, height: 100)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    private var glass: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                Ellipse()
                    .frame(width: 70, height: 30)
                    .offset(y: 15)
                    .zIndex(1)
                    .foregroundStyle(.glass)
                    .brightness(0.1)
                Rectangle()
                    .frame(width: 70, height: 100)
                    .foregroundStyle(.glass)
                Ellipse()
                    .frame(width: 70, height: 30)
                    .offset(y: -15)
                    .foregroundStyle(.glass)
            }
            Ellipse()
                .strokeBorder(lineWidth: 4)
                .frame(width: 70, height: 30)
                .offset(y: 15)
                .zIndex(1)
                .foregroundStyle(.glass)
        }
    }
    
    private var ice: some View {
        ZStack {
            VStack {
                Text("🧊")
                    .rotationEffect(.degrees(10))
                Text("🧊")
                    .offset(x: 10)
                    .rotationEffect(.degrees(-15))
                Text("🧊")
                    .offset(x: -10)
                    .rotationEffect(.degrees(20))
            }
        }
        .frame(width: 60, height: 70, alignment: .top)
        .font(.tossFace(.regular))
        .opacity(0.4)
        .offset(y: 12)
    }
    
    func getColor(for name: String) -> Color {
        if let ingredientColor = cocktailIngredientColors.first(where: { $0.name == name }) {
            return ingredientColor.color
        }
        return .blue
    }
}

#Preview {
    ZStack {
        Color.appSheetBackground.ignoresSafeArea()
        CocktailFactory(ingredients: [
            CocktailIngredient(name: "와인", amount: 1, colorName: "blue"),
            CocktailIngredient(name: "커피", amount: 2, colorName: "red"),
            CocktailIngredient(name: "칵테일", amount: 3, colorName: "green"),
            CocktailIngredient(name: "위스키", amount: 2, colorName: "orange"),
            CocktailIngredient(name: "자유", amount: 5, colorName: "yellow")
        ], isIce: true)
        .frame(maxWidth: .infinity)
        .padding(.top, 10)
        .padding(.bottom, 5)
        .padding(.horizontal)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.appSheetBoxBackground)
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}
