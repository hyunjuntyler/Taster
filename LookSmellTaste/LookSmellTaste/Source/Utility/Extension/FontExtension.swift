//
//  FontExtension.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

// MARK: - Pretendard 폰트
extension Font {
    private static let pretendardFontNames: [Font.Weight: String] = [
        .black: "Pretendard-Black",
        .heavy: "Pretendard-ExtraBold",
        .bold: "Pretendard-Bold",
        .semibold: "Pretendard-SemiBold",
        .medium: "Pretendard-Medium",
        .regular: "Pretendard-Regular",
        .light: "Pretendard-Light",
        .thin: "Pretendard-ExtraLight",
        .ultraLight: "Pretendard-Thin"
    ]
    
    private static let pretendardFontSizes: [Font.TextStyle: CGFloat] = [
        .largeTitle: 34,
        .title: 28,
        .title2: 22,
        .title3: 20,
        .headline: 17,
        .body: 17,
        .callout: 16,
        .subheadline: 15,
        .footnote: 13,
        .caption: 12,
        .caption2: 11
    ]
    
    static func pretendard(_ textStyle: Font.TextStyle, weight: Font.Weight = .regular) -> Font {
        let name = pretendardFontNames[weight, default: "Pretendard-Regular"]
        let size = pretendardFontSizes[textStyle, default: 17]
        return Font.custom(name, size: size, relativeTo: textStyle)
    }
    
    static func pretendard(size: CGFloat, textStyle: Font.TextStyle, weight: Font.Weight) -> Font {
        let name = pretendardFontNames[weight, default: "Pretendard-Regular"]
        return Font.custom(name, size: size, relativeTo: textStyle)
    }
}

// MARK: - TossFace 폰트
extension Font {
    enum TossFaceSize {
        case extraLarge, large, medium, regular, small
    }
    
    private static let tossFaceFontSizes: [TossFaceSize: (textStyle: Font.TextStyle, size: CGFloat)] = [
        .extraLarge: (.largeTitle, 44),
        .large: (.title, 36),
        .medium: (.title2, 30),
        .regular: (.body, 20),
        .small: (.caption, 16)
    ]
    
    static func tossFace(_ textStyle: TossFaceSize) -> Font {
        let fontSize = tossFaceFontSizes[textStyle, default: (.body, 20)]
        return Font.custom("TossFaceFontMac", size: fontSize.size, relativeTo: fontSize.textStyle)
    }
}

#Preview {
    VStack {
        let str = "Taster 테이스터 123456?! Wine"
        
        Text("🧑🏻‍💻")
            .font(.tossFace(.medium))
        
        Text(str)
            .font(.pretendard(.caption, weight: .semibold))
    }
}
