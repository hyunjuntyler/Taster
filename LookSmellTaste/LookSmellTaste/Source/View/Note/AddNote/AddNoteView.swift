//
//  AddNoteView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct AddNoteView: View {
    @State var showAlert = false
    @State var navigate = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appSheetBackground.ignoresSafeArea()
                VStack {
                    ScrollView {
                        Text("어떤 노트를 추가하고 싶으신가요?")
                            .font(.gmarketSansTitle3)
                            .padding(.bottom)
                        
                        HStack {
                            VStack {
                                Text("와인")
                                    .font(.gmarketSansBody)
                                Image("garnetWine")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 40)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .foregroundStyle(.appSheetBoxBackground)
                            }
                            VStack {
                                Text("커피")
                                    .font(.gmarketSansBody)
                                Image("coffee")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 50)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .foregroundStyle(.appSheetBoxBackground)
                            }
                            VStack {
                                Text("칵테일")
                                    .font(.gmarketSansBody)
                                Image("cocktail")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 40)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .foregroundStyle(.appSheetBoxBackground)
                            }
                        }
                        .padding(.horizontal)
                    }
                    NextButton {
                        navigate = true
                    }
                    .navigationDestination(isPresented: $navigate) {
                        Text("next view")
                    }
                }
            }
            .toolbar {
                CloseButton {
                    showAlert = true
                }
            }
        }
        .tint(.clear)
    }
}

#Preview {
    AddNoteView()
}
