//
//  WhiskeyNoteDetailView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI
import SwiftData

struct WhiskeyNoteDetailView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var note: WhiskeyNote
    @State private var showEditSheet = false
    @State private var showDeleteAlert = false
    
    var body: some View {
        VStack {
            ZStack {
                Color.appBackground.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("기본정보")
                            .font(.pretendard(.subheadline))
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
                                    .font(.pretendard(.caption))
                                Text(note.name)
                                    .font(.pretendard(.body))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.accentColor)
                                RatingDisplay(rating: note.rating)
                                Text("\(note.date.formatted(date: .abbreviated, time: .omitted))")
                                    .font(.pretendard(.caption))
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading) {
                            Text("테이스팅 노트")
                                .font(.pretendard(.subheadline))
                                .foregroundStyle(.gray)
                                .padding(.leading, 5)
                                .padding(.top)
                            VStack {
                                VStack(alignment: .leading) {
                                    Text("시각")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.pretendard(.subheadline))
                                        .foregroundStyle(.gray)
                                    HStack {
                                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                                            .frame(width: 16, height: 16)
                                            .foregroundStyle(getColor(color: note.color))
                                            .shadow(color: Color(.systemGray3), radius: 1)
                                        Text(note.color.name)
                                            .font(.pretendard(.subheadline))
                                    }
                                    .padding(.vertical, 3)
                                }
                                CustomDivider()
                                VStack {
                                    Text("후각")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.pretendard(.subheadline))
                                        .foregroundStyle(.gray)
                                    ScrollView(.horizontal) {
                                        HStack {
                                            ForEach(note.flavors) { flavor in
                                                VStack {
                                                    Image(flavor.imageName)
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 30, height: 30)
                                                    Text(flavor.name)
                                                        .font(.pretendard(.caption2))
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
                                CustomDivider()
                                Text("미각")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.pretendard(.subheadline))
                                    .foregroundStyle(.gray)
                                    .padding(.bottom, 10)
                                HexagonRadarChart(data: note.taste,
                                                  frame: 100)
                                .padding(.bottom)
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
                                .font(.pretendard(.subheadline))
                                .foregroundStyle(.gray)
                                .padding(.leading, 5)
                                .padding(.top)
                            VStack {
                                Text(note.think)
                                    .font(.pretendard(.callout))
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
                        .padding(.bottom)
                        
                        DeleteButton {
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
                        .font(.pretendard(.title3))
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showEditSheet = true
                    } label: {
                        Text("편집")
                            .font(.pretendard(.body))
                    }
                }
            }
            .sheet(isPresented: $showEditSheet) {
                WhiskeyNoteEditView(note: note)
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
    
    private enum WhiskeyColorName: String {
        case 밀짚색, 노란색, 황금색, 호박색, 갈색, 구리색, 적갈색, 오크색, 진갈색, 고동색
    }
    
    private func getColor(color: WhiskeyColor) -> Color {
        if let colorName = WhiskeyColorName(rawValue: color.name) {
            switch colorName {
            case .밀짚색: return .strawWhiskey
            case .노란색: return .yellowWhiskey
            case .황금색: return .goldWhiskey
            case .호박색: return .amberWhiskey
            case .갈색: return .brownWhiskey
            case .구리색: return .copperWhiskey
            case .적갈색: return .tawnyWhiskey
            case .오크색: return .oakWhiskey
            case .진갈색: return .burgundyWhiskey
            case .고동색: return .rustWhiskey
            }
        }
        return .rubyWine
    }
}

#if DEBUG
struct WhiskeyNoteDetailPreview: View {
    @Query private var whiskeyNotes: [WhiskeyNote]
    
    var body: some View {
        WhiskeyNoteDetailView(note: whiskeyNotes[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        WhiskeyNoteDetailPreview()
            .navigationBarTitleDisplayMode(.inline)
            .modelContainer(previewContainer)
    }
}
#endif
