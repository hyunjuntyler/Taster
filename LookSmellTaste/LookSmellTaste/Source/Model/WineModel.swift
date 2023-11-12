//
//  WineModel.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/8/23.
//

import SwiftUI

struct WineType: Identifiable, Hashable {
    var id = UUID()
    var typeName: String
    var typeImageName: String
}

let wineTypes: [WineType] = [
    WineType(typeName: "스파클링 와인", typeImageName: "sparklingWine"),
    WineType(typeName: "화이트 와인", typeImageName: "whiteWine"),
    WineType(typeName: "레드 와인", typeImageName: "redWine"),
    WineType(typeName: "디저트 와인", typeImageName: "dessertWine"),
    WineType(typeName: "로제 와인", typeImageName: "roseWine"),
    WineType(typeName: "오렌지 와인", typeImageName: "orangeWine"),
    WineType(typeName: "포트 와인", typeImageName: "portWine"),
    WineType(typeName: "샴페인", typeImageName: "champagne")
]

struct WineColor: Identifiable, Hashable {
    var id = UUID()
    var colorName: String
    var colorImageName: String
    var wineColor: Color
}

let wineColors: [WineColor] = [
    WineColor(colorName: "밀짚색", colorImageName: "strawWine", wineColor: .strawWine),
    WineColor(colorName: "노란색", colorImageName: "yellowWine", wineColor: .yellowWine),
    WineColor(colorName: "황금색", colorImageName: "goldWine", wineColor: .goldWine),
    WineColor(colorName: "호박색", colorImageName: "amberWine", wineColor: .amberWine),
    WineColor(colorName: "갈색", colorImageName: "brownWine", wineColor: .brownWine),
    WineColor(colorName: "구리색", colorImageName: "copperWine", wineColor: .copperWine),
    WineColor(colorName: "연어색", colorImageName: "salmonWine", wineColor: .salmonWine),
    WineColor(colorName: "분홍색", colorImageName: "pinkWine", wineColor: .pinkWine),
    WineColor(colorName: "루비색", colorImageName: "rubyWine", wineColor: .rubyWine),
    WineColor(colorName: "보라색", colorImageName: "purpleWine", wineColor: .purpleWine),
    WineColor(colorName: "석류색", colorImageName: "garnetWine", wineColor: .garnetWine),
    WineColor(colorName: "황갈색", colorImageName: "tawnyWine", wineColor: .tawnyWine)
]

struct WineScent: Identifiable, Hashable, Equatable {    
    var id = UUID()
    var scentName: String
    var scentImageName: String
}

let wineScents: [WineScent] = [
    WineScent(scentName: "블루베리", scentImageName: "blueberry"),
    WineScent(scentName: "올리브", scentImageName: "olive"),
    WineScent(scentName: "자두", scentImageName: "plum"),
    WineScent(scentName: "체리", scentImageName: "cherry"),
    WineScent(scentName: "크렌베리", scentImageName: "cranberry"),
    WineScent(scentName: "석류", scentImageName: "pomegranate"),
    WineScent(scentName: "산딸기", scentImageName: "raspberry"),
    WineScent(scentName: "딸기", scentImageName: "strawberry"),
    WineScent(scentName: "토마토", scentImageName: "tomato"),
    WineScent(scentName: "키위", scentImageName: "kiwi"),
    WineScent(scentName: "망고", scentImageName: "mango"),
    WineScent(scentName: "파인애플", scentImageName: "pineapple"),
    WineScent(scentName: "사과", scentImageName: "apple"),
    WineScent(scentName: "살구", scentImageName: "apricot"),
    WineScent(scentName: "복숭아", scentImageName: "peach"),
    WineScent(scentName: "자몽", scentImageName: "grapefruit"),
    WineScent(scentName: "레몬", scentImageName: "lemon"),
    WineScent(scentName: "라임", scentImageName: "lime"),
    WineScent(scentName: "오렌지", scentImageName: "orange"),
    WineScent(scentName: "아카시아", scentImageName: "acacia"),
    WineScent(scentName: "아이리스", scentImageName: "iris"),
    WineScent(scentName: "자스민", scentImageName: "jasmine"),
    WineScent(scentName: "라벤더", scentImageName: "lavender"),
    WineScent(scentName: "라일락", scentImageName: "lilac"),
    WineScent(scentName: "장미", scentImageName: "rose"),
    WineScent(scentName: "제비꽃", scentImageName: "violet"),
    WineScent(scentName: "홍차", scentImageName: "blacktea"),
    WineScent(scentName: "민트", scentImageName: "mint"),
    WineScent(scentName: "오레가노", scentImageName: "oregano"),
    WineScent(scentName: "계피", scentImageName: "cinamon"),
    WineScent(scentName: "후추", scentImageName: "blackpepper"),
    WineScent(scentName: "고추", scentImageName: "redpepper"),
    WineScent(scentName: "버터", scentImageName: "butter"),
    WineScent(scentName: "흙", scentImageName: "soil"),
    WineScent(scentName: "절인 고기", scentImageName: "marinatedmeat"),
    WineScent(scentName: "버섯", scentImageName: "mushroom"),
    WineScent(scentName: "연기", scentImageName: "smoke"),
    WineScent(scentName: "초콜릿", scentImageName: "chocolate"),
    WineScent(scentName: "커피", scentImageName: "coffee"),
    WineScent(scentName: "가죽", scentImageName: "leather"),
    WineScent(scentName: "견과류", scentImageName: "nuts"),
    WineScent(scentName: "코코넛", scentImageName: "coconut"),
    WineScent(scentName: "콜라", scentImageName: "coke"),
    WineScent(scentName: "바닐라", scentImageName: "vanilla")
]
