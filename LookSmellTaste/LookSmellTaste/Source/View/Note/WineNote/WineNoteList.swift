//
//  WineNoteList.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI
import SwiftData

struct WineNoteList: View {
    let note: WineNote
    
    var body: some View {
        VStack {
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
                        Image(note.type.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                    }
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(note.type.name)
                            .font(.gmarketSansCaption)
                        Spacer()
                        Text("\(note.date.formatted(date: .abbreviated, time: .omitted))")
                            .font(.gmarketSansCaption)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.accentColor)
                            .fontWeight(.semibold)
                    }
                    .font(.caption)
                    Text(note.name)
                        .lineLimit(1)
                        .foregroundColor(.accentColor)
                        .font(.gmarketSansHeadline)
                    RatingDisplay(rating: note.rating)
                }
            }
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.appSheetBoxBackground)
            }
        }
    }
}

#if DEBUG
struct WineNoteListPreview: View {
    @Query private var wineNotes: [WineNote]
    
    var body: some View {
        WineNoteList(note: wineNotes[0])
    }
}

#Preview { @MainActor in
    ZStack {
        Color.appBackground.ignoresSafeArea()
        WineNoteListPreview()
            .modelContainer(previewContainer)
            .padding(.horizontal)
    }
}
#endif
