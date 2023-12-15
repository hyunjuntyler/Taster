//
//  Filter.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/15/23.
//

import SwiftUI

struct Filter: View {
    @Binding var showFilter: Bool
    @Binding var sortOption: SortOption
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.appBackground.opacity(0.1).ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        showFilter = false
                    }
                }
            VStack {
                ForEach(filters) { filter in
                    VStack {
                        Button {
                            Haptic.impact(style: .soft)
                            withAnimation {
                                sortOption = filter.sort
                                showFilter = false
                            }
                        } label: {
                            HStack {
                                Text(filter.label)
                                Spacer()
                                if sortOption == filter.sort {
                                    Image(systemName: "checkmark")
                                        .fontWeight(.bold)
                                        .font(.callout)
                                }
                            }
                            .padding(5)
                        }
                        
                        if filter.sort != .lowestRated {
                            CustomDivider()
                        }
                    }
                }
            }
            .font(.gmarketSansBody)
            .frame(width: 200)
            .padding(12)
            .background {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .foregroundStyle(.ultraThinMaterial)
                    .shadow(radius: 120)
            }
            .padding(.horizontal)
        }
        .transition(
            .asymmetric(
                insertion: .opacity,
                removal: .opacity.animation(.easeOut(duration: 0.1))
            )
        )
    }
}

#Preview {
    Filter(showFilter: .constant(true), sortOption: .constant(.mostRecent))
}
