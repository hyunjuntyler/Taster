//
//  ContentView.swift
//  Taster
//
//  Created by hyunjun on 11/5/23.
//

import SwiftData
import SwiftUI

struct Content: View {
    var body: some View {
        NavigationStack {
            AllNoteList()
        }
    }
}

#Preview {
    Content()
        .modelContainer(SchemaV2.sample)
}
