//
//  AddCocktailFactoryView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/12/23.
//

import SwiftUI

struct AddCocktailFactoryView: View {
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @Bindable private var observable = CockatilNoteObservable.shared

    @State private var navigate = false
    @State private var addIngredientSheet = false
    
    @State private var ingredients: [CocktailIngredient] = []
    @State private var isIce = false

    var body: some View {
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("Factory")
                        .font(.gmarketSansTitle)
                        .padding(.bottom)
                    Text("마셨던 칵테일을 만들어 보세요")
                        .font(.gmarketSansBody)
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                    VStack {
                        CocktailFactory(ingredients: ingredients, isIce: isIce)
                            .overlay(alignment: .bottomTrailing) {
                                addIceButton
                            }
                        
                        CustomDivider()
                        
                        addIngredientButton
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.appSheetBoxBackground)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                
                NextButton(disabled: false) {
                    navigate = true
                }
            }
        }
        .navigationTitle("")
        .sheet(isPresented: $addIngredientSheet) {
            addGredientSheet
                .presentationDetents([.medium])
                .presentationCornerRadius(20)
        }
        .toolbar {
            CloseButton {
                noteEnvironment.showCloseAlert = true
            }
        }
    }
    
    private var addGredientSheet: some View {
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
        }
    }
    
    private var addIngredientButton: some View {
        Button {
            Haptic.impact(style: .soft)
            addIngredientSheet = true
        } label: {
            HStack {
                Image(systemName: "plus.circle.fill")
                    .font(.title3)
                Text("재료 추가하기")
                    .font(.gmarketSansBody)
            }
            .foregroundStyle(.accent)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 5)
        }
        .buttonStyle(PressButtonStyle())
    }
    
    private var addIceButton: some View {
        Button {
            Haptic.impact(style: .soft)
            withAnimation {
                isIce.toggle()
            }
        } label: {
            HStack(spacing: 3) {
                if isIce {
                    RoundedRectangle(cornerRadius: 3, style: .continuous)
                        .frame(width: 12, height: 12)
                } else {
                    RoundedRectangle(cornerRadius: 3, style: .continuous)
                        .strokeBorder(lineWidth: 2)
                        .frame(width: 12, height: 12)
                }
                Text("얼음")
                    .font(.gmarketSansSubHeadline)
            }
        }
        .foregroundStyle(.accent)
        .buttonStyle(PressButtonStyle())
    }
}

#Preview {
    NavigationStack {
        AddCocktailFactoryView()
            .environment(NoteEnvironment())
    }
}
