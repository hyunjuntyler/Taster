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
