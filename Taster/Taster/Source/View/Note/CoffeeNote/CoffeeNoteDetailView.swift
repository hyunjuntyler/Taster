//
//  CoffeeNoteDetailView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI
import SwiftData

struct CoffeeNoteDetailView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var note: CoffeeNote
    @State private var showEditSheet = false
    @State private var showDeleteAlert = false
    
    var body: some View {
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
                            VStack {
                                Text("향미")
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
                            RoundedRectangle(cornerRadius: 3, style: .continuous)
                                .frame(height: 1)
                                .foregroundStyle(.appPickerGray)
                            Text("차트")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.pretendard(.subheadline))
                                .foregroundStyle(.gray)
                                .padding(.bottom, 10)
                            PentagonRadarChart(
                                data: note.taste,
                                valueList: ["신맛", "바디", "쓴맛", "향미", "단맛"],
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
            CoffeeNoteEditView(note: note)
                .presentationCornerRadius(24)
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
}

#if DEBUG
struct CoffeeNoteDetailPreview: View {
    @Query private var coffeeNotes: [CoffeeNote]
    
    var body: some View {
        CoffeeNoteDetailView(note: coffeeNotes[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        CoffeeNoteDetailPreview()         
            .navigationBarTitleDisplayMode(.inline)
            .modelContainer(previewContainer)
    }
}
#endif
