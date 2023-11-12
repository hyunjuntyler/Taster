//
//  ContentView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().shadowImage = UIImage()
        
        let backButtonImage = UIImage(systemName: "chevron.backward.circle.fill")
        UINavigationBar.appearance().backIndicatorImage = backButtonImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backButtonImage
    }
    
    var body: some View {
        MainTabView()
    }
}

#Preview {
    ContentView()
}
