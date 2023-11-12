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
    }
    
    var body: some View {
        MainTabView()
    }
}

#Preview {
    ContentView()
}
