//
//  WineNoteView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/8/23.
//

import SwiftUI
import SwiftData

enum SortOption {
    case date
    case rating
}

struct WineNoteView: View {
    @Query private var wineNotes: [WineNote]
    @State private var sortOption: SortOption = .date
    
    private var sortedWineNotes: [WineNote] {
        wineNotes.sort(on: sortOption)
    }
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(sortedWineNotes) { note in
                        NavigationLink {
                            WineNoteDetailView(note: note)
                        } label: {
                            WineNoteList(note: note)
                        }
                        .buttonStyle(PressButtonStyle())
                    }
                }
                .padding(.top)
                .padding(.horizontal)
            }
        }
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("모든 와인 노트")
                    .font(.gmarketSansTitle3)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
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
}

private extension [WineNote] {
    func sort(on option: SortOption) -> [WineNote] {
        switch option {
        case .date:
            self.sorted(by: { $0.date > $1.date })
        case .rating:
            self.sorted(by: { $0.rating > $1.rating })
        }
    }
}

#if DEBUG
#Preview { @MainActor in
    NavigationStack {
        WineNoteView()
            .modelContainer(previewContainer)
            .navigationBarTitleDisplayMode(.inline)
    }
}
#endif
