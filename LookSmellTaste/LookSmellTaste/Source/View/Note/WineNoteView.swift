//
//  WineNoteView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/8/23.
//

import SwiftUI
import SwiftData

struct WineNoteView: View {
    @Query(sort: \WineNote.date, order: .reverse) private var wineNotes: [WineNote]

    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("와인 노트")
                            .font(.gmarketSansTitle3)
                        Spacer()
                    }
                    .padding(.horizontal, 5)
                    LazyVStack {
                        let recentWineNotes = wineNotes.prefix(3)
                        
                        ForEach(recentWineNotes) { note in
                            NavigationLink {
                                Text(note.name)
                            } label: {
                                HStack {
                                    if let data = note.image {
                                        if let image = UIImage(data: data) {
                                            Image(uiImage: image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 60, height: 60)
                                                .clipShape(
                                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                                )
                                        }
                                    } else {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                                .frame(width: 60, height: 60)
                                                .foregroundStyle(.appPickerGray)
                                            Image(note.type.typeImageName)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 40)
                                        }
                                    }
                                    
                                    Text(note.name)
                                        .font(.gmarketSansBody)
                                }
                                .padding(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background {
                                    RoundedRectangle(cornerRadius: 16)
                                        .foregroundStyle(.appSheetBoxBackground)
                                }
                            }
                            .buttonStyle(PressButtonStyle())
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)
            }
        }
    }
}

#Preview {
    WineNoteView()
        .modelContainer(previewContainer)
}
