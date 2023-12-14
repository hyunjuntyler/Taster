//
//  WhiskeyNoteView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI
import SwiftData

struct WhiskeyNoteView: View {
    @Query private var whiskeyNotes: [WhiskeyNote]
    @State private var sortOption: SortOption = .date
    
    private var sortedWhiskeyNotes: [WhiskeyNote] {
        whiskeyNotes.sort(on: sortOption)
    }
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading) {
                    LazyVStack {
                        ForEach(sortedWhiskeyNotes) { note in
                            NavigationLink {
                                WhiskeyNoteDetailView(note: note)
                            } label: {
                                WhiskeyNoteList(note: note)
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
                Text("모든 위스키 노트")
                    .font(.gmarketSansTitle3)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Haptic.impact(style: .soft)
                    withAnimation {
                        if sortOption == .date {
                            sortOption = .rating
                        } else {
                            sortOption = .date
                        }
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

private extension [WhiskeyNote] {
    func sort(on option: SortOption) -> [WhiskeyNote] {
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
        WhiskeyNoteView()
            .modelContainer(previewContainer)
            .navigationBarTitleDisplayMode(.inline)
    }
}
#endif
