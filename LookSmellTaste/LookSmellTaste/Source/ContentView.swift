//
//  ContentView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    @Query private var user: [User]
    @State private var navigateToUserView = false
    
    var body: some View {
        if user.isEmpty {
            SignInView()
        } else {
            NavigationStack {
                ZStack {
                    Color.appBackground.ignoresSafeArea()
                    NoteView(navigateToUserView: $navigateToUserView)
                }
                .navigationTitle("")
                .navigationDestination(isPresented: $navigateToUserView) {
                    UserView(navigateToUserView: $navigateToUserView)
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview { @MainActor in
    ContentView()
        .modelContainer(previewContainer)
}
