//
//  CoffeeModel.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI

struct CoffeeType: Identifiable, Codable, Hashable {
    var id = UUID()
    var typeName: String
    var typeImageName: String
}

let coffeeTypes: [CoffeeType] = [
    CoffeeType(typeName: "드립 커피", typeImageName: "dripCoffee"),
    CoffeeType(typeName: "캡슐 커피", typeImageName: "capsuleCoffee"),
    CoffeeType(typeName: "카페 커피", typeImageName: "cafeCoffee"),
    CoffeeType(typeName: "홈 커피", typeImageName: "homeCoffee")
]

struct CoffeeFlavor: Identifiable, Codable, Hashable {
    var id = UUID()
    var flavorName: String
    var flavorImageName: String
}

let coffeeFlavors: [CoffeeFlavor] = [
    CoffeeFlavor(flavorName: "레몬", flavorImageName: "lemon"),
    CoffeeFlavor(flavorName: "라임", flavorImageName: "lime"),
    CoffeeFlavor(flavorName: "자몽", flavorImageName: "grapefruit"),
    CoffeeFlavor(flavorName: "오렌지", flavorImageName: "orange"),
    CoffeeFlavor(flavorName: "사과", flavorImageName: "apple"),
    CoffeeFlavor(flavorName: "배", flavorImageName: "pear"),
    CoffeeFlavor(flavorName: "수박", flavorImageName: "watermelon"),
    CoffeeFlavor(flavorName: "청포도", flavorImageName: "greengrape"),
    CoffeeFlavor(flavorName: "적포도", flavorImageName: "redgrape"),
    CoffeeFlavor(flavorName: "리치", flavorImageName: "lychee"),
    CoffeeFlavor(flavorName: "파인애플", flavorImageName: "pineapple"),
    CoffeeFlavor(flavorName: "망고", flavorImageName: "mango"),
    CoffeeFlavor(flavorName: "키위", flavorImageName: "kiwi"),
    CoffeeFlavor(flavorName: "바나나", flavorImageName: "banana"),
    CoffeeFlavor(flavorName: "코코넛", flavorImageName: "coconut"),
    CoffeeFlavor(flavorName: "복숭아", flavorImageName: "peach"),
    CoffeeFlavor(flavorName: "살구", flavorImageName: "apricot"),
    CoffeeFlavor(flavorName: "자두", flavorImageName: "plum"),
    CoffeeFlavor(flavorName: "체리", flavorImageName: "cherry"),
    CoffeeFlavor(flavorName: "크렌베리", flavorImageName: "cranberry"),
    CoffeeFlavor(flavorName: "산딸기", flavorImageName: "raspberry"),
    CoffeeFlavor(flavorName: "딸기", flavorImageName: "strawberry"),
    CoffeeFlavor(flavorName: "블루베리", flavorImageName: "blueberry"),
    CoffeeFlavor(flavorName: "건포도", flavorImageName: "raisin"),
    CoffeeFlavor(flavorName: "초콜릿", flavorImageName: "chocolate"),
    CoffeeFlavor(flavorName: "바닐라", flavorImageName: "vanilla"),
    CoffeeFlavor(flavorName: "꿀", flavorImageName: "honey"),
    CoffeeFlavor(flavorName: "버터", flavorImageName: "butter"),
    CoffeeFlavor(flavorName: "크림", flavorImageName: "cream"),
    CoffeeFlavor(flavorName: "마시멜로", flavorImageName: "marshmallow"),
    CoffeeFlavor(flavorName: "설탕", flavorImageName: "sugar"),
    CoffeeFlavor(flavorName: "콜라", flavorImageName: "coke"),
    CoffeeFlavor(flavorName: "견과류", flavorImageName: "nuts"),
    CoffeeFlavor(flavorName: "팝콘", flavorImageName: "popcorn"),
    CoffeeFlavor(flavorName: "밀", flavorImageName: "wheat"),
    CoffeeFlavor(flavorName: "빵", flavorImageName: "bread"),
    CoffeeFlavor(flavorName: "연기", flavorImageName: "smoke"),
    CoffeeFlavor(flavorName: "후추", flavorImageName: "blackpepper"),
    CoffeeFlavor(flavorName: "계피", flavorImageName: "cinamon"),
    CoffeeFlavor(flavorName: "고수", flavorImageName: "cilantro"),
    CoffeeFlavor(flavorName: "생강", flavorImageName: "ginger"),
    CoffeeFlavor(flavorName: "가죽", flavorImageName: "leather"),
    CoffeeFlavor(flavorName: "흙", flavorImageName: "soil"),
    CoffeeFlavor(flavorName: "나무", flavorImageName: "wood"),
    CoffeeFlavor(flavorName: "잎", flavorImageName: "leaf"),
    CoffeeFlavor(flavorName: "올리브", flavorImageName: "olive"),
    CoffeeFlavor(flavorName: "피망", flavorImageName: "pimento"),
    CoffeeFlavor(flavorName: "호박", flavorImageName: "pumpkin"),
    CoffeeFlavor(flavorName: "버섯", flavorImageName: "mushroom"),
    CoffeeFlavor(flavorName: "당근", flavorImageName: "carrot"),
    CoffeeFlavor(flavorName: "토마토", flavorImageName: "tomato"),
    CoffeeFlavor(flavorName: "민트", flavorImageName: "mint"),
    CoffeeFlavor(flavorName: "녹차", flavorImageName: "greentea"),
    CoffeeFlavor(flavorName: "홍차", flavorImageName: "blacktea"),
    CoffeeFlavor(flavorName: "베르가못", flavorImageName: "bergamot"),
    CoffeeFlavor(flavorName: "장미", flavorImageName: "rose"),
    CoffeeFlavor(flavorName: "라벤더", flavorImageName: "lavender"),
    CoffeeFlavor(flavorName: "자스민", flavorImageName: "jasmine")
]
