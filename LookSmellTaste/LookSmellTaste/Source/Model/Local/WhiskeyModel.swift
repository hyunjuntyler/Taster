//
//  WhiskeyModel.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI

struct WhiskeyType: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var imageName: String
}

struct WhiskeyColor: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var imageName: String
}

struct WhiskeyScent: Identifiable, Codable, Hashable, Equatable {
    var id = UUID()
    var name: String
    var imageName: String
}

let whiskeyTypes = [
    WhiskeyType(name: "버번 위스키", imageName: "bourbon"),
    WhiskeyType(name: "테네시 위스키", imageName: "tennessee"),
    WhiskeyType(name: "아이리쉬 위스키", imageName: "irish"),
    WhiskeyType(name: "스카치 위스키", imageName: "scotch"),
    WhiskeyType(name: "화이트 위스키", imageName: "white"),
    WhiskeyType(name: "라이 위스키", imageName: "rye"),
    WhiskeyType(name: "캐나디안 위스키", imageName: "canadian"),
    WhiskeyType(name: "일본 위스키", imageName: "japanese")
]

let whiskeyColors = [
    WhiskeyColor(name: "밀짚색", imageName: "strawWhiskey"),
    WhiskeyColor(name: "노란색", imageName: "yellowWhiskey"),
    WhiskeyColor(name: "황금색", imageName: "goldWhiskey"),
    WhiskeyColor(name: "호박색", imageName: "amberWhiskey"),
    WhiskeyColor(name: "갈색", imageName: "brownWhiskey"),
    WhiskeyColor(name: "구리색", imageName: "copperWhiskey"),
    WhiskeyColor(name: "적갈색", imageName: "tawnyWhiskey"),
    WhiskeyColor(name: "오크색", imageName: "oakWhisky"),
    WhiskeyColor(name: "진갈색", imageName: "burgundyWhiskey"),
    WhiskeyColor(name: "고동색", imageName: "rustWhiskey")
]

let whiskeyScents = [
    WhiskeyScent(name: "레몬", imageName: "lemon"),
    WhiskeyScent(name: "라임", imageName: "lime"),
    WhiskeyScent(name: "자몽", imageName: "grapefruit"),
    WhiskeyScent(name: "오렌지", imageName: "orange"),
    WhiskeyScent(name: "사과", imageName: "apple"),
    WhiskeyScent(name: "배", imageName: "pear"),
    WhiskeyScent(name: "수박", imageName: "watermelon"),
    WhiskeyScent(name: "청포도", imageName: "greengrape"),
    WhiskeyScent(name: "적포도", imageName: "redgrape"),
    WhiskeyScent(name: "리치", imageName: "lychee"),
    WhiskeyScent(name: "파인애플", imageName: "pineapple"),
    WhiskeyScent(name: "망고", imageName: "mango"),
    WhiskeyScent(name: "키위", imageName: "kiwi"),
    WhiskeyScent(name: "바나나", imageName: "banana"),
    WhiskeyScent(name: "코코넛", imageName: "coconut"),
    WhiskeyScent(name: "복숭아", imageName: "peach"),
    WhiskeyScent(name: "살구", imageName: "apricot"),
    WhiskeyScent(name: "자두", imageName: "plum"),
    WhiskeyScent(name: "체리", imageName: "cherry"),
    WhiskeyScent(name: "크렌베리", imageName: "cranberry"),
    WhiskeyScent(name: "산딸기", imageName: "raspberry"),
    WhiskeyScent(name: "딸기", imageName: "strawberry"),
    WhiskeyScent(name: "블루베리", imageName: "blueberry"),
    WhiskeyScent(name: "건포도", imageName: "raisin"),
    WhiskeyScent(name: "초콜릿", imageName: "chocolate"),
    WhiskeyScent(name: "바닐라", imageName: "vanilla"),
    WhiskeyScent(name: "꿀", imageName: "honey"),
    WhiskeyScent(name: "버터", imageName: "butter"),
    WhiskeyScent(name: "크림", imageName: "cream"),
    WhiskeyScent(name: "마시멜로", imageName: "marshmallow"),
    WhiskeyScent(name: "설탕", imageName: "sugar"),
    WhiskeyScent(name: "콜라", imageName: "coke"),
    WhiskeyScent(name: "견과류", imageName: "nuts"),
    WhiskeyScent(name: "팝콘", imageName: "popcorn"),
    WhiskeyScent(name: "밀", imageName: "wheat"),
    WhiskeyScent(name: "빵", imageName: "bread"),
    WhiskeyScent(name: "연기", imageName: "smoke"),
    WhiskeyScent(name: "후추", imageName: "blackpepper"),
    WhiskeyScent(name: "계피", imageName: "cinamon"),
    WhiskeyScent(name: "고수", imageName: "cilantro"),
    WhiskeyScent(name: "생강", imageName: "ginger"),
    WhiskeyScent(name: "가죽", imageName: "leather"),
    WhiskeyScent(name: "흙", imageName: "soil"),
    WhiskeyScent(name: "나무", imageName: "wood"),
    WhiskeyScent(name: "잎", imageName: "leaf"),
    WhiskeyScent(name: "올리브", imageName: "olive"),
    WhiskeyScent(name: "피망", imageName: "pimento"),
    WhiskeyScent(name: "호박", imageName: "pumpkin"),
    WhiskeyScent(name: "버섯", imageName: "mushroom"),
    WhiskeyScent(name: "당근", imageName: "carrot"),
    WhiskeyScent(name: "토마토", imageName: "tomato"),
    WhiskeyScent(name: "민트", imageName: "mint"),
    WhiskeyScent(name: "녹차", imageName: "greentea"),
    WhiskeyScent(name: "홍차", imageName: "blacktea"),
    WhiskeyScent(name: "베르가못", imageName: "bergamot"),
    WhiskeyScent(name: "장미", imageName: "rose"),
    WhiskeyScent(name: "라벤더", imageName: "lavender"),
    WhiskeyScent(name: "자스민", imageName: "jasmine")
]
