//
//  ImagePicker.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/14/23.
//

import SwiftUI

struct ImagePicker: View {
    var defaultImageName: String = ""
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.appPickerGray)
                Image(defaultImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
            }
            
            Spacer()
            
            VStack {
                Text("선택한 이미지는 썸네일 이미지로 활용돼요")
                    .font(.gmarketSansCaption)
                    .foregroundStyle(.gray)
                    .frame(maxHeight: .infinity)
                HStack {
                    Button {
                        Haptic.impact(style: .soft)
                    } label: {
                        Text("기본")
                            .font(.gmarketSansFootnote)
                            .foregroundStyle(.gray)
                            .padding(12)
                            .background {
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .foregroundStyle(.appPickerGray)
                            }
                    }
                    .buttonStyle(PressButtonStyle())
                    
                    Button {
                        Haptic.impact(style: .soft)
                    } label: {
                        Text("앨범에서 선택")
                            .font(.gmarketSansFootnote)
                            .foregroundStyle(.gray)
                            .padding(12)
                            .background {
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .foregroundStyle(.appPickerGray)
                            }
                    }
                    .buttonStyle(PressButtonStyle())
                    
                    Button {
                        Haptic.impact(style: .soft)
                    } label: {
                        Text("사진찍기")
                            .font(.gmarketSansFootnote)
                            .foregroundStyle(.gray)
                            .padding(12)
                            .background {
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .foregroundStyle(.appPickerGray)
                            }
                    }
                    .buttonStyle(PressButtonStyle())
                }
            }
        }
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .foregroundStyle(.appSheetBoxBackground)
        }
    }
}

#Preview {
    ZStack {
        Color.appSheetBackground.ignoresSafeArea()
        ScrollView {
            ImagePicker()
                .padding(.horizontal)
                .padding(.top, 300)
        }
    }
}
