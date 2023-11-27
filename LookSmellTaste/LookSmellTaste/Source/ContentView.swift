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
    
    var body: some View {
        if user.isEmpty {
            SignInView()
        } else {
            ZStack {
                Color.appBackground.ignoresSafeArea()
                NoteView()
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    ContentView()
}
