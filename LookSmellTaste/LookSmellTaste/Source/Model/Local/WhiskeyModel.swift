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

struct WhiskeyFlavor: Identifiable, Codable, Hashable, Equatable {
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

let whiskeyFlavors = [
    WhiskeyFlavor(name: "레몬", imageName: "lemon"),
    WhiskeyFlavor(name: "라임", imageName: "lime"),
    WhiskeyFlavor(name: "자몽", imageName: "grapefruit"),
    WhiskeyFlavor(name: "오렌지", imageName: "orange"),
    WhiskeyFlavor(name: "사과", imageName: "apple"),
    WhiskeyFlavor(name: "배", imageName: "pear"),
    WhiskeyFlavor(name: "수박", imageName: "watermelon"),
    WhiskeyFlavor(name: "청포도", imageName: "greengrape"),
    WhiskeyFlavor(name: "적포도", imageName: "redgrape"),
    WhiskeyFlavor(name: "리치", imageName: "lychee"),
    WhiskeyFlavor(name: "파인애플", imageName: "pineapple"),
    WhiskeyFlavor(name: "망고", imageName: "mango"),
    WhiskeyFlavor(name: "키위", imageName: "kiwi"),
    WhiskeyFlavor(name: "바나나", imageName: "banana"),
    WhiskeyFlavor(name: "코코넛", imageName: "coconut"),
    WhiskeyFlavor(name: "복숭아", imageName: "peach"),
    WhiskeyFlavor(name: "살구", imageName: "apricot"),
    WhiskeyFlavor(name: "자두", imageName: "plum"),
    WhiskeyFlavor(name: "체리", imageName: "cherry"),
    WhiskeyFlavor(name: "크렌베리", imageName: "cranberry"),
    WhiskeyFlavor(name: "산딸기", imageName: "raspberry"),
    WhiskeyFlavor(name: "딸기", imageName: "strawberry"),
    WhiskeyFlavor(name: "블루베리", imageName: "blueberry"),
    WhiskeyFlavor(name: "건포도", imageName: "raisin"),
    WhiskeyFlavor(name: "초콜릿", imageName: "chocolate"),
    WhiskeyFlavor(name: "바닐라", imageName: "vanilla"),
    WhiskeyFlavor(name: "꿀", imageName: "honey"),
    WhiskeyFlavor(name: "버터", imageName: "butter"),
    WhiskeyFlavor(name: "크림", imageName: "cream"),
    WhiskeyFlavor(name: "마시멜로", imageName: "marshmallow"),
    WhiskeyFlavor(name: "설탕", imageName: "sugar"),
    WhiskeyFlavor(name: "콜라", imageName: "coke"),
    WhiskeyFlavor(name: "견과류", imageName: "nuts"),
    WhiskeyFlavor(name: "팝콘", imageName: "popcorn"),
    WhiskeyFlavor(name: "밀", imageName: "wheat"),
    WhiskeyFlavor(name: "빵", imageName: "bread"),
    WhiskeyFlavor(name: "스모크", imageName: "smoke"),
    WhiskeyFlavor(name: "피트", imageName: "peak"),
    WhiskeyFlavor(name: "후추", imageName: "blackpepper"),
    WhiskeyFlavor(name: "계피", imageName: "cinamon"),
    WhiskeyFlavor(name: "고수", imageName: "cilantro"),
    WhiskeyFlavor(name: "생강", imageName: "ginger"),
    WhiskeyFlavor(name: "가죽", imageName: "leather"),
    WhiskeyFlavor(name: "흙", imageName: "soil"),
    WhiskeyFlavor(name: "나무", imageName: "wood"),
    WhiskeyFlavor(name: "잎", imageName: "leaf"),
    WhiskeyFlavor(name: "올리브", imageName: "olive"),
    WhiskeyFlavor(name: "피망", imageName: "pimento"),
    WhiskeyFlavor(name: "호박", imageName: "pumpkin"),
    WhiskeyFlavor(name: "버섯", imageName: "mushroom"),
    WhiskeyFlavor(name: "당근", imageName: "carrot"),
    WhiskeyFlavor(name: "토마토", imageName: "tomato"),
    WhiskeyFlavor(name: "민트", imageName: "mint"),
    WhiskeyFlavor(name: "녹차", imageName: "greentea"),
    WhiskeyFlavor(name: "홍차", imageName: "blacktea"),
    WhiskeyFlavor(name: "베르가못", imageName: "bergamot"),
    WhiskeyFlavor(name: "장미", imageName: "rose"),
    WhiskeyFlavor(name: "라벤더", imageName: "lavender"),
    WhiskeyFlavor(name: "자스민", imageName: "jasmine")
]
