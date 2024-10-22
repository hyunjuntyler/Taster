//
//  SchemaV1StoredProperty.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import Foundation
import SwiftUI

enum SchemaV1StoredProperty {
    typealias WineColor = SchemaV1.WineColor
    typealias WineType = SchemaV1.WineType
    typealias WineScent = SchemaV1.WineScent
    typealias CoffeeType = SchemaV1.CoffeeType
    typealias CoffeeFlavor = SchemaV1.CoffeeFlavor
    typealias WhiskeyType = SchemaV1.WhiskeyType
    typealias WhiskeyColor = SchemaV1.WhiskeyColor
    typealias WhiskeyFlavor = SchemaV1.WhiskeyFlavor
    typealias CocktailType = SchemaV1.CocktailType
    typealias CocktailIngredientColor = SchemaV1.CocktailIngredientColor
    
    static let wineTypes: [WineType] = [
        WineType(name: "스파클링 와인", imageName: "sparklingWine"),
        WineType(name: "화이트 와인", imageName: "whiteWine"),
        WineType(name: "레드 와인", imageName: "redWine"),
        WineType(name: "디저트 와인", imageName: "dessertWine"),
        WineType(name: "로제 와인", imageName: "roseWine"),
        WineType(name: "오렌지 와인", imageName: "orangeWine"),
        WineType(name: "포트 와인", imageName: "portWine"),
        WineType(name: "샴페인", imageName: "champagne")
    ]
    
    static let wineColors: [WineColor] = [
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
    
    static let wineScents: [SchemaV1.WineScent] = [
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
    
    static let coffeeTypes: [CoffeeType] = [
        CoffeeType(name: "드립 커피", imageName: "dripCoffee"),
        CoffeeType(name: "캡슐 커피", imageName: "capsuleCoffee"),
        CoffeeType(name: "카페 커피", imageName: "cafeCoffee"),
        CoffeeType(name: "홈 커피", imageName: "homeCoffee")
    ]
    
    static let coffeeFlavors: [CoffeeFlavor] = [
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
        CoffeeFlavor(name: "스모크", imageName: "smoke"),
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
    
    static let whiskeyTypes = [
        WhiskeyType(name: "버번 위스키", imageName: "bourbon"),
        WhiskeyType(name: "테네시 위스키", imageName: "tennessee"),
        WhiskeyType(name: "아이리쉬 위스키", imageName: "irish"),
        WhiskeyType(name: "스카치 위스키", imageName: "scotch"),
        WhiskeyType(name: "화이트 위스키", imageName: "white"),
        WhiskeyType(name: "라이 위스키", imageName: "rye"),
        WhiskeyType(name: "캐나디안 위스키", imageName: "canadian"),
        WhiskeyType(name: "일본 위스키", imageName: "japanese")
    ]

    static let whiskeyColors = [
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

    static let whiskeyFlavors = [
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

    static let cocktailTypes: [CocktailType] = [
        CocktailType(name: "홈 칵테일", imageName: "homeCocktail"),
        CocktailType(name: "바 칵테일", imageName: "barCocktail")
    ]
    
    static let cocktailIngredientColors: [CocktailIngredientColor] = [
        CocktailIngredientColor(name: "blue", color: .blue),
        CocktailIngredientColor(name: "red", color: .red),
        CocktailIngredientColor(name: "green", color: .green),
        CocktailIngredientColor(name: "indigo", color: .indigo),
        CocktailIngredientColor(name: "yellow", color: .yellow),
        CocktailIngredientColor(name: "gray", color: .gray),
        CocktailIngredientColor(name: "orange", color: .orange),
        CocktailIngredientColor(name: "brown", color: .brown),
        CocktailIngredientColor(name: "cyan", color: .cyan),
        CocktailIngredientColor(name: "mint", color: .mint),
        CocktailIngredientColor(name: "pink", color: .pink),
        CocktailIngredientColor(name: "purple", color: .purple),
        CocktailIngredientColor(name: "teal", color: .teal)
    ]
}
