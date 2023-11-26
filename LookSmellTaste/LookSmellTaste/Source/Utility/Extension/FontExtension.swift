//
//  FontExtension.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

extension Font {
    static let tossFaceSmall = Font.custom("TossFaceFontMac", size: 16, relativeTo: .body)
    static let tossFaceMedium = Font.custom("TossFaceFontMac", size: 20, relativeTo: .body)
    static let tossFaceLarge = Font.custom("TossFaceFontMac", size: 30, relativeTo: .body)
    static let tossFaceXLarge = Font.custom("TossFaceFontMac", size: 36, relativeTo: .body)
    
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
    static let gmarketSansTab = Font.custom("GmarketSansTTFMedium", size: 0, relativeTo: .caption2)
}
