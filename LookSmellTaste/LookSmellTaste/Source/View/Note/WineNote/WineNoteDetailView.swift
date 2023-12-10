//
//  WineNoteDetailView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/8/23.
//

import SwiftUI
import SwiftData

struct WineNoteDetailView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var note: WineNote
    @State private var showEditSheet = false
    @State private var showDeleteAlert = false

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
                            .padding(.top)
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
                                    Image(note.type.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 60)
                                }
                            }
                            VStack(alignment: .leading, spacing: 5) {
                                Text(note.type.name)
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
                                            .foregroundStyle(getColor(color: note.color))
                                            .shadow(color: Color(.systemGray3), radius: 1)
                                        Text(note.color.name)
                                            .font(.gmarketSansSubHeadline)
                                    }
                                    .padding(.vertical, 3)
                                }
                                RoundedRectangle(cornerRadius: 3, style: .continuous)
                                    .frame(height: 1)
                                    .foregroundStyle(.appPickerGray)
                                VStack {
                                    Text("후각")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.gmarketSansSubHeadline)
                                        .foregroundStyle(.gray)
                                    ScrollView(.horizontal) {
                                        HStack {
                                            ForEach(note.scents) { scent in
                                                    VStack {
                                                        Image(scent.imageName)
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 30, height: 30)
                                                        Text(scent.name)
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
                                RoundedRectangle(cornerRadius: 3, style: .continuous)
                                    .frame(height: 1)
                                    .foregroundStyle(.appPickerGray)
                                Text("미각")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.gmarketSansSubHeadline)
                                    .foregroundStyle(.gray)
                                    .padding(.bottom, 10)
                                RadarChart(data: note.taste,
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
                                Text(note.think)
                                    .font(.gmarketSansCallout)
                                    .lineSpacing(5)
                            }
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundStyle(.appSheetBoxBackground)
                            }
                        }
                        
                        DeleteButton {
                            Haptic.notification(type: .warning)
                            withAnimation {
                                showDeleteAlert = true
                            }
                        }
                        .padding(.vertical)
                    }
                    .padding(.horizontal)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(note.name)
                        .font(.gmarketSansTitle3)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showEditSheet = true
                    } label: {
                        Text("편집")
                            .font(.gmarketSansBody)
                    }
                }
            }
            .sheet(isPresented: $showEditSheet) {
                WineNoteEditView(note: note)
                    .presentationCornerRadius(24)
            }
        }
        .overlay {
            if showDeleteAlert {
                DeleteAlert(showDeleteAlert: $showDeleteAlert) {
                    withAnimation {
                        delete()
                    }
                }
            }
        }
    }
    
    private func delete() {
        context.delete(note)
        dismiss()
    }
    
    private enum WineColorName: String {
        case 밀짚색, 노란색, 황금색, 호박색, 갈색, 구리색, 연어색, 분홍색, 루비색, 보라색, 석류색, 황갈색
    }

    private func getColor(color: WineColor) -> Color {
        if let colorName = WineColorName(rawValue: color.name) {
            switch colorName {
            case .밀짚색: return .strawWine
            case .노란색: return .yellowWine
            case .황금색: return .goldWine
            case .호박색: return .amberWine
            case .갈색: return .brownWine
            case .구리색: return .copperWine
            case .연어색: return .salmonWine
            case .분홍색: return .pinkWine
            case .루비색: return .rubyWine
            case .보라색: return .purpleWine
            case .석류색: return .garnetWine
            case .황갈색: return .tawnyWine
            }
        }
        return .rubyWine
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
            .navigationBarTitleDisplayMode(.inline)
    }
}
