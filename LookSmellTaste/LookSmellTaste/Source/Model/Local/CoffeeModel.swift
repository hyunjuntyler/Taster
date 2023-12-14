//
//  CoffeeModel.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI

struct CoffeeType: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var imageName: String
}

struct CoffeeFlavor: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var imageName: String
}

let coffeeTypes: [CoffeeType] = [
    CoffeeType(name: "드립 커피", imageName: "dripCoffee"),
    CoffeeType(name: "캡슐 커피", imageName: "capsuleCoffee"),
    CoffeeType(name: "카페 커피", imageName: "cafeCoffee"),
    CoffeeType(name: "홈 커피", imageName: "homeCoffee")
]

let coffeeFlavors: [CoffeeFlavor] = [
    CoffeeFlavor(name: "레몬", imageName: "lemon"),
    CoffeeFlavor(name: "라임", imageName: "lime"),
    CoffeeFlavor(name: "자몽", imageName: "grapefruit"),
    CoffeeFlavor(name: "오렌지", imageName: "orange"),
    CoffeeFlavor(name: "사과", imageName: "apple"),
    CoffeeFlavor(name: "배", imageName: "pear"),
    CoffeeFlavor(name: "수박", imageName: "watermelon"),
    CoffeeFlavor(name: "청포도", imageName: "greengrape"),
    CoffeeFlavor(name: "적포도", imageName: "redgrape"),
    CoffeeFlavor(name: "리치", imageName: "lychee"),
    CoffeeFlavor(name: "파인애플", imageName: "pineapple"),
    CoffeeFlavor(name: "망고", imageName: "mango"),
    CoffeeFlavor(name: "키위", imageName: "kiwi"),
    CoffeeFlavor(name: "바나나", imageName: "banana"),
    CoffeeFlavor(name: "코코넛", imageName: "coconut"),
    CoffeeFlavor(name: "복숭아", imageName: "peach"),
    CoffeeFlavor(name: "살구", imageName: "apricot"),
    CoffeeFlavor(name: "자두", imageName: "plum"),
    CoffeeFlavor(name: "체리", imageName: "cherry"),
    CoffeeFlavor(name: "크렌베리", imageName: "cranberry"),
    CoffeeFlavor(name: "산딸기", imageName: "raspberry"),
    CoffeeFlavor(name: "딸기", imageName: "strawberry"),
    CoffeeFlavor(name: "블루베리", imageName: "blueberry"),
    CoffeeFlavor(name: "건포도", imageName: "raisin"),
    CoffeeFlavor(name: "초콜릿", imageName: "chocolate"),
    CoffeeFlavor(name: "바닐라", imageName: "vanilla"),
    CoffeeFlavor(name: "꿀", imageName: "honey"),
    CoffeeFlavor(name: "버터", imageName: "butter"),
    CoffeeFlavor(name: "크림", imageName: "cream"),
    CoffeeFlavor(name: "마시멜로", imageName: "marshmallow"),
    CoffeeFlavor(name: "설탕", imageName: "sugar"),
    CoffeeFlavor(name: "콜라", imageName: "coke"),
    CoffeeFlavor(name: "견과류", imageName: "nuts"),
    CoffeeFlavor(name: "팝콘", imageName: "popcorn"),
    CoffeeFlavor(name: "밀", imageName: "wheat"),
    CoffeeFlavor(name: "빵", imageName: "bread"),
    CoffeeFlavor(name: "연기", imageName: "smoke"),
    CoffeeFlavor(name: "후추", imageName: "blackpepper"),
    CoffeeFlavor(name: "계피", imageName: "cinamon"),
    CoffeeFlavor(name: "고수", imageName: "cilantro"),
    CoffeeFlavor(name: "생강", imageName: "ginger"),
    CoffeeFlavor(name: "가죽", imageName: "leather"),
    CoffeeFlavor(name: "흙", imageName: "soil"),
    CoffeeFlavor(name: "나무", imageName: "wood"),
    CoffeeFlavor(name: "잎", imageName: "leaf"),
    CoffeeFlavor(name: "올리브", imageName: "olive"),
    CoffeeFlavor(name: "피망", imageName: "pimento"),
    CoffeeFlavor(name: "호박", imageName: "pumpkin"),
    CoffeeFlavor(name: "버섯", imageName: "mushroom"),
    CoffeeFlavor(name: "당근", imageName: "carrot"),
    CoffeeFlavor(name: "토마토", imageName: "tomato"),
    CoffeeFlavor(name: "민트", imageName: "mint"),
    CoffeeFlavor(name: "녹차", imageName: "greentea"),
    CoffeeFlavor(name: "홍차", imageName: "blacktea"),
    CoffeeFlavor(name: "베르가못", imageName: "bergamot"),
    CoffeeFlavor(name: "장미", imageName: "rose"),
    CoffeeFlavor(name: "라벤더", imageName: "lavender"),
    CoffeeFlavor(name: "자스민", imageName: "jasmine")
]
