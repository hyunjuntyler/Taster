//
//  CocktailNoteDetailView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 12/13/23.
//

import SwiftUI
import SwiftData

struct CocktailNoteDetailView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var note: CocktailNote
    @State private var showEditSheet = false
    @State private var showDeleteAlert = false
    
    private let tasteLabels = ["단맛", "신맛", "도수"]
    private let symbolColors: [Color] = [.orange, .blue, .red]
    
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
                            CocktailFactory(ingredients: note.ingredients, isIce: note.isIce)
                            ForEach(note.taste.indices, id: \.self) { index in
                                CustomDivider()
                                HStack {
                                    Text(tasteLabels[index])
                                        .font(.pretendard(.body))
                                    Spacer()
                                    RatingCircle(rating: note.taste[index], ratingColor: symbolColors[index])
                                }
                            }
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
            CocktailNoteEditView(note: note)
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
struct CocktailNoteDetailPreview: View {
    @Query private var cocktailNotes: [CocktailNote]
    
    var body: some View {
        CocktailNoteDetailView(note: cocktailNotes[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        CocktailNoteDetailPreview()
            .navigationBarTitleDisplayMode(.inline)
            .modelContainer(previewContainer)
    }
}
#endif
