//
//  WineModel.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/8/23.
//

import SwiftUI

struct WineType: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var imageName: String
}

let wineTypes: [WineType] = [
    WineType(name: "스파클링 와인", imageName: "sparklingWine"),
    WineType(name: "화이트 와인", imageName: "whiteWine"),
    WineType(name: "레드 와인", imageName: "redWine"),
    WineType(name: "디저트 와인", imageName: "dessertWine"),
    WineType(name: "로제 와인", imageName: "roseWine"),
    WineType(name: "오렌지 와인", imageName: "orangeWine"),
    WineType(name: "포트 와인", imageName: "portWine"),
    WineType(name: "샴페인", imageName: "champagne")
]

struct WineColor: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var imageName: String
}

let wineColors: [WineColor] = [
    WineColor(name: "밀짚색", imageName: "strawWine"),
    WineColor(name: "노란색", imageName: "yellowWine"),
    WineColor(name: "황금색", imageName: "goldWine"),
    WineColor(name: "호박색", imageName: "amberWine"),
    WineColor(name: "갈색", imageName: "brownWine"),
    WineColor(name: "구리색", imageName: "copperWine"),
    WineColor(name: "연어색", imageName: "salmonWine"),
    WineColor(name: "분홍색", imageName: "pinkWine"),
    WineColor(name: "루비색", imageName: "rubyWine"),
    WineColor(name: "보라색", imageName: "purpleWine"),
    WineColor(name: "석류색", imageName: "garnetWine"),
    WineColor(name: "황갈색", imageName: "tawnyWine")
]

struct WineScent: Identifiable, Codable, Hashable, Equatable {    
    var id = UUID()
    var name: String
    var imageName: String
}

let wineScents: [WineScent] = [
    WineScent(name: "블루베리", imageName: "blueberry"),
    WineScent(name: "올리브", imageName: "olive"),
    WineScent(name: "자두", imageName: "plum"),
    WineScent(name: "체리", imageName: "cherry"),
    WineScent(name: "크렌베리", imageName: "cranberry"),
    WineScent(name: "석류", imageName: "pomegranate"),
    WineScent(name: "산딸기", imageName: "raspberry"),
    WineScent(name: "딸기", imageName: "strawberry"),
    WineScent(name: "토마토", imageName: "tomato"),
    WineScent(name: "키위", imageName: "kiwi"),
    WineScent(name: "망고", imageName: "mango"),
    WineScent(name: "파인애플", imageName: "pineapple"),
    WineScent(name: "사과", imageName: "apple"),
    WineScent(name: "살구", imageName: "apricot"),
    WineScent(name: "복숭아", imageName: "peach"),
    WineScent(name: "자몽", imageName: "grapefruit"),
    WineScent(name: "레몬", imageName: "lemon"),
    WineScent(name: "라임", imageName: "lime"),
    WineScent(name: "오렌지", imageName: "orange"),
    WineScent(name: "아카시아", imageName: "acacia"),
    WineScent(name: "아이리스", imageName: "iris"),
    WineScent(name: "자스민", imageName: "jasmine"),
    WineScent(name: "라벤더", imageName: "lavender"),
    WineScent(name: "라일락", imageName: "lilac"),
    WineScent(name: "장미", imageName: "rose"),
    WineScent(name: "제비꽃", imageName: "violet"),
    WineScent(name: "홍차", imageName: "blacktea"),
    WineScent(name: "민트", imageName: "mint"),
    WineScent(name: "오레가노", imageName: "oregano"),
    WineScent(name: "계피", imageName: "cinamon"),
    WineScent(name: "후추", imageName: "blackpepper"),
    WineScent(name: "고추", imageName: "redpepper"),
    WineScent(name: "버터", imageName: "butter"),
    WineScent(name: "흙", imageName: "soil"),
    WineScent(name: "절인 고기", imageName: "marinatedmeat"),
    WineScent(name: "버섯", imageName: "mushroom"),
    WineScent(name: "연기", imageName: "smoke"),
    WineScent(name: "초콜릿", imageName: "chocolate"),
    WineScent(name: "커피", imageName: "coffee"),
    WineScent(name: "가죽", imageName: "leather"),
    WineScent(name: "견과류", imageName: "nuts"),
    WineScent(name: "코코넛", imageName: "coconut"),
    WineScent(name: "콜라", imageName: "coke"),
    WineScent(name: "바닐라", imageName: "vanilla")
]
