//
//  ContentView.swift
//  Taster
//
//  Created by hyunjun on 11/5/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query private var wineNote: [SchemaV2.WineTastingNote]
    @Query private var coffeeNote: [SchemaV2.CoffeeTastingNote]
    @Query private var cocktailNote: [SchemaV2.CocktailTastingNote]
    @Query private var whiskeyNote: [SchemaV2.WhiskeyTastingNote]
    
    var body: some View {
        VStack {
            Text("wine \(wineNote.count)")
            Text("coffee \(coffeeNote.count)")
            Text("cocktail \(cocktailNote.count)")
            Text("whiskey \(whiskeyNote.count)")
        }
    }
}

#Preview {
    ContentView()
}
