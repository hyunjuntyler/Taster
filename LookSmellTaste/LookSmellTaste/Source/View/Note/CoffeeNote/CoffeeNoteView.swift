//
//  CoffeeNoteView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI
import SwiftData

struct CoffeeNoteView: View {
    @Query private var coffeeNotes: [CoffeeNote]
    @State private var sortOption: SortOption = .mostRecent
    @State private var showFilter = false
    
    private var sortedCoffeeNotes: [CoffeeNote] {
        coffeeNotes.sort(on: sortOption)
    }
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    LazyVStack {
                        ForEach(sortedCoffeeNotes) { note in
                            NavigationLink {
                                CoffeeNoteDetailView(note: note)
                            } label: {
                                CoffeeNoteList(note: note)
                            }
                            .buttonStyle(PressButtonStyle())
                        }
                    }
                }
                .padding(.top)
                .padding(.horizontal)
            }
        }
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("모든 커피 노트")
                    .font(.pretendard(.title3))
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("필터") {
                    Haptic.impact(style: .soft)
                    withAnimation {
                        showFilter.toggle()
                    }
                }
                .font(.pretendard(.body))
            }
        }
        .overlay(alignment: .topTrailing) {
            if showFilter {
                Filter(showFilter: $showFilter, sortOption: $sortOption)
            }
        }
    }
}

private extension [CoffeeNote] {
    func sort(on option: SortOption) -> [CoffeeNote] {
        switch option {
        case .mostRecent:
            self.sorted(by: { $0.date > $1.date })
        case .oldestFirst:
            self.sorted(by: { $0.date < $1.date })
        case .highestRated:
            self.sorted(by: { $0.rating > $1.rating })
        case .lowestRated:
            self.sorted(by: { $0.rating < $1.rating })
        }
    }
}

#if DEBUG
#Preview { @MainActor in
    NavigationStack {
        CoffeeNoteView()
            .modelContainer(previewContainer)
            .navigationBarTitleDisplayMode(.inline)
    }
}
#endif
