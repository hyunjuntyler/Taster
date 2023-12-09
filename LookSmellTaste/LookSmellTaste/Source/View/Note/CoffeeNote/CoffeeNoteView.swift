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
    @State private var sortOption: SortOption = .date
    
    private var sortedCoffeeNotes: [CoffeeNote] {
        coffeeNotes.sort(on: sortOption)
    }
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("전체 커피 노트")
                            .font(.gmarketSansTitle)
                        Spacer()
                    }
                    .padding(.horizontal, 5)
                    
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
                .padding(.horizontal)
            }
        }
        .navigationTitle("")
        .toolbar {
            Button {
                Haptic.impact(style: .soft)
                if sortOption == .date {
                    sortOption = .rating
                } else {
                    sortOption = .date
                }
            } label: {
                VStack {
                    Image(systemName: sortOption == .date ? "clock.fill" : "star.fill")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .contentTransition(.symbolEffect(.replace))
                        .frame(height: 20)
                    Text(sortOption == .date ? "최신순" : "점수순")
                        .font(.gmarketSansCaption2)
                }
                .foregroundStyle(.accent)
            }
            .buttonStyle(PressButtonStyle())
        }
    }
}

private extension [CoffeeNote] {
    func sort(on option: SortOption) -> [CoffeeNote] {
        switch option {
        case .date:
            self.sorted(by: { $0.date > $1.date })
        case .rating:
            self.sorted(by: { $0.rating > $1.rating })
        }
    }
}

#Preview {
    NavigationStack {
        CoffeeNoteView()
            .modelContainer(previewContainer)
    }
}
