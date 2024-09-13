//
//  ContentView.swift
//  Taster
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var user: [User]
    @State private var navigateToUserView = false
    @AppStorage("onboarding") private var onboarding = true
    
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
                .sheet(isPresented: $onboarding) {
                    OnboardingView()
                        .interactiveDismissDisabled()
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#if DEBUG
#Preview { @MainActor in
    ContentView()
        .modelContainer(previewContainer)
}
#endif
