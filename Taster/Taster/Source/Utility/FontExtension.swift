//
//  FontExtension.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import SwiftUI

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
