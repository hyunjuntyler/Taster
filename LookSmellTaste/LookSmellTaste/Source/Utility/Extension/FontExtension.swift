//
//  FontExtension.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

extension Font {
    static let tossFaceSmall = Font.custom("TossFaceFontMac", size: 16, relativeTo: .caption)
    static let tossFaceMedium = Font.custom("TossFaceFontMac", size: 20, relativeTo: .body)
    static let tossFaceLarge = Font.custom("TossFaceFontMac", size: 30, relativeTo: .title2)
    static let tossFaceXLarge = Font.custom("TossFaceFontMac", size: 36, relativeTo: .title)
    static let tossFaceXXLarge = Font.custom("TossFaceFontMac", size: 44, relativeTo: .largeTitle)
    
    static let gmarketSansLargeTitle = Font.custom("GmarketSansTTFMedium", size: 30, relativeTo: .largeTitle)
    static let gmarketSansTitle = Font.custom("GmarketSansTTFMedium", size: 26, relativeTo: .title)
    static let gmarketSansTitle2 = Font.custom("GmarketSansTTFMedium", size: 21, relativeTo: .title2)
    static let gmarketSansTitle3 = Font.custom("GmarketSansTTFMedium", size: 19, relativeTo: .title3)
    static let gmarketSansButton = Font.custom("GmarketSansTTFMedium", size: 17, relativeTo: .headline)
    static let gmarketSansHeadline = Font.custom("GmarketSansTTFMedium", size: 16, relativeTo: .headline)
    static let gmarketSansBody = Font.custom("GmarketSansTTFMedium", size: 16, relativeTo: .body)
    static let gmarketSansCallout = Font.custom("GmarketSansTTFMedium", size: 15, relativeTo: .callout)
    static let gmarketSansSubHeadline = Font.custom("GmarketSansTTFMedium", size: 14, relativeTo: .subheadline)
    static let gmarketSansFootnote = Font.custom("GmarketSansTTFMedium", size: 12, relativeTo: .footnote)
    static let gmarketSansCaption = Font.custom("GmarketSansTTFMedium", size: 11, relativeTo: .caption)
    static let gmarketSansCaption2 = Font.custom("GmarketSansTTFMedium", size: 10, relativeTo: .caption2)
}

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
