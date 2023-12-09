//
//  WineNoteDetailView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/8/23.
//

import SwiftUI
import SwiftData

struct WineNoteDetailView: View {
    let note: WineNote

    var body: some View {
        VStack {
            ZStack {
                Color.appBackground.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("기본정보")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading, 5)
                        HStack(spacing: 10) {
                            if let data = note.image {
                                if let image = UIImage(data: data) {
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 80)
                                        .clipShape(
                                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        )
                                }
                            } else {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .frame(width: 80, height: 80)
                                        .foregroundStyle(.appListBoxBackground)
                                    Image(note.type.typeImageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 60)
                                }
                            }
                            VStack(alignment: .leading, spacing: 5) {
                                Text(note.type.typeName)
                                    .font(.gmarketSansCaption)
                                Text(note.name)
                                    .font(.gmarketSansBody)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.accentColor)
                                RatingDisplay(rating: note.rating)
                                Text("\(note.date.formatted(date: .abbreviated, time: .omitted))")
                                    .font(.gmarketSansCaption)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading) {
                            Text("테이스팅 노트")
                                .font(.gmarketSansSubHeadline)
                                .foregroundStyle(.gray)
                                .padding(.leading, 5)
                                .padding(.top)
                            VStack {
                                VStack(alignment: .leading) {
                                    Text("시각")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.gmarketSansSubHeadline)
                                        .foregroundStyle(.gray)
                                    HStack {
                                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                                            .frame(width: 16, height: 16)
                                            .foregroundStyle(.amberWine)
                                            .shadow(color: Color(.systemGray3), radius: 1)
                                        Text(note.color.colorName)
                                            .font(.gmarketSansSubHeadline)
                                    }
                                    .padding(.vertical, 3)
                                }
                                Divider()
                                VStack {
                                    Text("후각")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.gmarketSansSubHeadline)
                                        .foregroundStyle(.gray)
                                    ScrollView(.horizontal) {
                                        HStack {
                                            ForEach(note.scents) { scent in
                                                    VStack {
                                                        Image(scent.scentImageName)
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 30, height: 30)
                                                        Text(scent.scentName)
                                                            .font(.gmarketSansCaption2)
                                                            .fontWeight(.regular)
                                                    }
                                                    .padding(8)
                                                    .padding(.horizontal, 3)
                                                    .background {
                                                        RoundedRectangle(cornerRadius: 12)
                                                            .foregroundStyle(.appPickerGray)
                                                    }
                                            }
                                        }
                                        .safeAreaInset(edge: .leading) {
                                            Color.clear.frame(width: 6, height: 41)
                                        }
                                        .safeAreaInset(edge: .trailing) {
                                            Color.clear.frame(width: 6, height: 41)
                                        }
                                    }
                                    .scrollIndicators(.hidden)
                                    .padding(.horizontal, -16)
                                    .padding(.bottom, 5)
                                }
                                Divider()
                                Text("미각")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.gmarketSansSubHeadline)
                                    .foregroundStyle(.gray)
                                    .padding(.bottom, 10)
                                RadarChart(data: ([3, 3, 2, 3, 5]),
                                           frame: 100)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundStyle(.appSheetBoxBackground)
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text("추가 노트")
                                .font(.gmarketSansSubHeadline)
                                .foregroundStyle(.gray)
                                .padding(.leading, 5)
                                .padding(.top)
                            VStack {
                                Text("추가 노트")
                                    .font(.gmarketSansBody)
                            }
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundStyle(.appSheetBoxBackground)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                    } label: {
                        Text("편집")
                            .font(.gmarketSansBody)
                    }
                }
            }
        }
    }
}

struct WineNoteDetailPreview: View {
    @Query private var wineNotes: [WineNote]
    
    var body: some View {
        WineNoteDetailView(note: wineNotes[0])
    }
}

#Preview {
    NavigationStack {
        WineNoteDetailPreview()
            .modelContainer(previewContainer)
    }
}
