//
//  ContentView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NoteView()
                .tabItem {
                    Text("노트")
                    Image(systemName: "book.pages")
                }
            ShareView()
                .tabItem {
                    Text("공유")
                    Image(systemName: "person.2")
                }
        }
    }
}

#Preview {
    ContentView()
}
