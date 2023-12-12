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
                        
                        CustomDivider()
                        
                        AddIngredientButton {
                            addIngredientSheet = true
                        }
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
        .toolbar {
            CloseButton {
                noteEnvironment.showCloseAlert = true
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddCocktailFactoryView()
            .environment(NoteEnvironment())
    }
}
