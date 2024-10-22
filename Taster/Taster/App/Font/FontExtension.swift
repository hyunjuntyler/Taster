//
//  FontExtension.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import SwiftUI

// MARK: - TossFace 폰트
extension Font {
    enum TossFace {
        static let name = "TossFaceFontMac"
        
        static let largeTitle = Font.custom(name, size: 34, relativeTo: .largeTitle)
        static let title = Font.custom(name, size: 28, relativeTo: .title)
        static let title2 = Font.custom(name, size: 22, relativeTo: .title2)
        static let title3 = Font.custom(name, size: 20, relativeTo: .title2)
        static let body = Font.custom(name, size: 17, relativeTo: .body)
        static let caption = Font.custom(name, size: 12, relativeTo: .caption)
    }
}
