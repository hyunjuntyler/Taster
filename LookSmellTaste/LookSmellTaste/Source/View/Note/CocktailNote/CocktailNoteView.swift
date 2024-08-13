//
//  CocktailNoteView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 12/13/23.
//

import SwiftUI
import SwiftData

struct CocktailNoteView: View {
    @Query private var cocktailNotes: [CocktailNote]
    @State private var sortOption: SortOption = .mostRecent
    @State private var showFilter = false
    
    private var sortedCocktailNotes: [CocktailNote] {
        cocktailNotes.sort(on: sortOption)
    }
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading) {
                    LazyVStack {
                        ForEach(sortedCocktailNotes) { note in
                            NavigationLink {
                                CocktailNoteDetailView(note: note)
                            } label: {
                                CocktailNoteList(note: note)
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
                Text("모든 칵테일 노트")
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

private extension [CocktailNote] {
    func sort(on option: SortOption) -> [CocktailNote] {
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
        CocktailNoteView()
            .modelContainer(previewContainer)
            .navigationBarTitleDisplayMode(.inline)
    }
}
#endif
