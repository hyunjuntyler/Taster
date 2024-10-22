//
//  SchemaV2StoredProperty.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import Foundation
import SwiftUI

enum SchemaV2StoredProperty {
    enum Wine {
        static let categories: [Category] = [
            .sparklingWine, .whiteWine, .redWine, .naturalWine, .dessertWine, .roseWine, .orangeWine, .portWine, .champagne, .otherWine
        ]
        
        static let looks: [Look] = [
            .straw, .yellow, .gold, .amber, .brown, .copper, .salmon, .pink, .ruby, .purple, .garnet, .tawny
        ]
        
        static let smells: [Smell] = [
            .blueberry, .olive, .plum, .cherry, .cranberry, .pomegranate, .raspberry, .strawberry, .tomato, .kiwi, .mango, .pineapple, .apple, .apricot, .peach, .grapefruit, .lemon, .lime, .orange, .acacia, .iris, .jasmine, .lavender, .lilac, .rose, .violet, .blacktea, .mint, .oregano, .cinnamon, .blackpepper, .redpepper, .butter, .soil, .marinatedmeat, .mushroom, .smoke, .chocolate, .coffee, .leather, .nuts, .coconut, .coke, .vanilla
        ]
    }
    
    enum Coffee {
        static let categories: [Category] = [
            .dripCoffee, .capsuleCoffee, .cafeCoffee, .homeCoffee
        ]
        
        static let smells: [Smell] = [
            .lemon, .lime, .grapefruit, .orange, .apple, .pear, .watermelon, .greengrape, .redgrape, .lychee,
            .pineapple, .mango, .kiwi, .banana, .coconut, .peach, .apricot, .plum, .cherry, .cranberry,
            .raspberry, .strawberry, .blueberry, .raisin, .chocolate, .vanilla, .honey, .butter, .cream,
            .marshmallow, .sugar, .coke, .nuts, .popcorn, .wheat, .bread, .smoke, .blackpepper, .cinnamon,
            .cilantro, .ginger, .leather, .soil, .wood, .leaf, .olive, .pimento, .pumpkin, .mushroom, .carrot,
            .tomato, .mint, .greentea, .blacktea, .bergamot, .rose, .lavender, .jasmine
        ]
    }
    
    enum Whiskey {
        static let categories: [Category] = [
            .blendedWhiskey, .bourbonWhiskey, .canadianWhiskey, .cornWhiskey, .grainWhiskey, .irishWhiskey, .japaneseWhiskey, .otherWhiskey, .potstillWhiskey, .ryeWhiskey, .scotchWhiskey, .singlemaltWhiskey, .tennesseeWhiskey, .whiteWhiskey
        ]
        
        static let looks: [Look] = [
            .straw, .yellow, .gold, .amber, .brown, .copper, .tawny, .oak, .burgundy, .rust
        ]

        static let smells: [Smell] = [
            .lemon, .lime, .grapefruit, .orange, .apple, .pear, .watermelon, .greengrape, .redgrape, .lychee,
            .pineapple, .mango, .kiwi, .banana, .coconut, .peach, .apricot, .plum, .cherry, .cranberry,
            .raspberry, .strawberry, .blueberry, .raisin, .chocolate, .vanilla, .honey, .butter, .cream,
            .marshmallow, .sugar, .coke, .nuts, .popcorn, .wheat, .bread, .smoke, .peat, .blackpepper,
            .cinnamon, .cilantro, .ginger, .leather, .soil, .wood, .leaf, .olive, .pimento, .pumpkin, .mushroom,
            .carrot, .tomato, .mint, .greentea, .blacktea, .bergamot, .rose, .lavender, .jasmine
        ]
    }
    
    enum Cocktail {
        static let categories: [Category] = [
            .homeCocktail, .barCocktail
        ]
        
        enum IngredientColors: String {
            case red, orange, yellow, green, mint, cyan, teal, blue, indigo, purple, pink, brown, gray
            
            var color: Color {
                switch self {
                case .red: .red
                case .orange: .orange
                case .yellow: .yellow
                case .green: .green
                case .mint: .mint
                case .cyan: .cyan
                case .teal: .teal
                case .blue: .blue
                case .indigo: .indigo
                case .purple: .purple
                case .pink: .pink
                case .brown: .brown
                case .gray: .gray
                }
            }
        }
    }
    
    enum Category: String {
        case sparklingWine, whiteWine, redWine, naturalWine, dessertWine, roseWine, orangeWine, portWine, champagne, otherWine
        case dripCoffee, capsuleCoffee, cafeCoffee, homeCoffee
        case blendedWhiskey, bourbonWhiskey, canadianWhiskey, cornWhiskey, grainWhiskey, irishWhiskey, japaneseWhiskey, otherWhiskey, potstillWhiskey, ryeWhiskey, scotchWhiskey, singlemaltWhiskey, tennesseeWhiskey, whiteWhiskey
        case homeCocktail, barCocktail

        var description: String {
            switch self {
            case .sparklingWine: "스파클링 와인"
            case .whiteWine: "화이트 와인"
            case .redWine: "레드 와인"
            case .naturalWine: "내추럴 와인"
            case .dessertWine: "디저트 와인"
            case .roseWine: "로제 와인"
            case .orangeWine: "오렌지 와인"
            case .portWine: "포트 와인"
            case .champagne: "샴페인"
            case .otherWine: "기타 와인"
            case .dripCoffee: "드립 커피"
            case .capsuleCoffee: "캡슐 커피"
            case .cafeCoffee: "카페 커피"
            case .homeCoffee: "홈 커피"
            case .blendedWhiskey: "블렌디드 위스키"
            case .bourbonWhiskey: "버번 위스키"
            case .canadianWhiskey: "캐나디안 위스키"
            case .cornWhiskey: "콘 위스키"
            case .grainWhiskey: "그레인 위스키"
            case .irishWhiskey: "아이리쉬 위스키"
            case .japaneseWhiskey: "일본 위스키"
            case .otherWhiskey: "기타 위스키"
            case .potstillWhiskey: "포트스틸 위스키"
            case .ryeWhiskey: "라이 위스키"
            case .scotchWhiskey: "스카치 위스키"
            case .singlemaltWhiskey: "싱글몰트 위스키"
            case .tennesseeWhiskey: "테네시 위스키"
            case .whiteWhiskey: "화이트 위스키"
            case .homeCocktail: "홈 칵테일"
            case .barCocktail: "바 칵테일"
            }
        }

        var uiImage: UIImage {
            switch self {
            case .sparklingWine: .sparklingWine
            case .whiteWine: .whiteWine
            case .redWine: .redWine
            case .naturalWine: .naturalWine
            case .dessertWine: .dessertWine
            case .roseWine: .roseWine
            case .orangeWine: .orangeWine
            case .portWine: .portWine
            case .champagne: .champagne
            case .otherWine: .otherWine
            case .dripCoffee: .dripCoffee
            case .capsuleCoffee: .capsuleCoffee
            case .cafeCoffee: .cafeCoffee
            case .homeCoffee: .homeCoffee
            case .blendedWhiskey: .blendedWhiskey
            case .bourbonWhiskey: .bourbonWhiskey
            case .canadianWhiskey: .canadianWhiskey
            case .cornWhiskey: .cornWhiskey
            case .grainWhiskey: .grainWhiskey
            case .irishWhiskey: .irishWhiskey
            case .japaneseWhiskey: .japaneseWhiskey
            case .otherWhiskey: .otherWhiskey
            case .potstillWhiskey: .potstillWhiskey
            case .ryeWhiskey: .ryeWhiskey
            case .scotchWhiskey: .scotchWhiskey
            case .singlemaltWhiskey: .singlemaltWhiskey
            case .tennesseeWhiskey: .tennesseeWhiskey
            case .whiteWhiskey: .whiteWhiskey
            case .homeCocktail: .homeCocktail
            case .barCocktail: .barCocktail
            }
        }
    }
    
    enum Look: String {
        case straw, yellow, gold, amber, brown, copper, salmon, pink, ruby, purple, garnet, tawny, oak, burgundy, rust
        
        var description: String {
            switch self {
            case .straw: "밀짚색"
            case .yellow: "노란색"
            case .gold: "황금색"
            case .amber: "호박색"
            case .brown: "갈색"
            case .copper: "구리색"
            case .salmon: "연어색"
            case .pink: "분홍색"
            case .ruby: "루비색"
            case .purple: "보라색"
            case .garnet: "석류색"
            case .tawny: "황갈색"
            case .oak: "오크색"
            case .burgundy: "버건디색"
            case .rust: "고동색"
            }
        }
        
        var color: Color {
            switch self {
            case .straw: .appStraw
            case .yellow: .appYellow
            case .gold: .appGold
            case .amber: .appAmber
            case .brown: .appBrown
            case .copper: .appCopper
            case .salmon: .appSalmon
            case .pink: .appPink
            case .ruby: .appRuby
            case .purple: .appPurple
            case .garnet: .appGarnet
            case .tawny: .appTawny
            case .oak: .appOak
            case .burgundy: .appBurgundy
            case .rust: .appRust
            }
        }
    }
    
    enum Smell: String {
        case acacia, apple, apricot, banana, bergamot, blackpepper, blacktea, blueberry, bread, butter, carrot, cherry, chocolate, cilantro, cinnamon, coconut, coffee, coke, cream, cranberry, ginger, grapefruit, greengrape, greentea, honey, iris, kiwi, jasmine, lavender, leaf, leather, lemon, lime, lilac, lychee, mango, marinatedmeat, marshmallow, mint, mushroom, nuts, olive, orange, oregano, peach, pear, peat, pimento, pineapple, plum, pomegranate, popcorn, pumpkin, raisin, raspberry, redgrape, redpepper, rose, soil, smoke, strawberry, sugar, tomato, vanilla, violet, watermelon, wheat, wood
        
        var description: String {
            switch self {
            case .acacia: "아카시아"
            case .apple: "사과"
            case .apricot: "살구"
            case .banana: "바나나"
            case .bergamot: "베르가못"
            case .blackpepper: "후추"
            case .blacktea: "홍차"
            case .blueberry: "블루베리"
            case .bread: "빵"
            case .butter: "버터"
            case .carrot: "당근"
            case .cherry: "체리"
            case .chocolate: "초콜릿"
            case .cilantro: "고수"
            case .cinnamon: "계피"
            case .coconut: "코코넛"
            case .coffee: "커피"
            case .coke: "콜라"
            case .cream: "크림"
            case .cranberry: "크랜베리"
            case .ginger: "생강"
            case .grapefruit: "자몽"
            case .greengrape: "청포도"
            case .greentea: "녹차"
            case .honey: "꿀"
            case .iris: "아이리스"
            case .kiwi: "키위"
            case .jasmine: "자스민"
            case .lavender: "라벤더"
            case .leaf: "잎"
            case .leather: "가죽"
            case .lemon: "레몬"
            case .lime: "라임"
            case .lilac: "라일락"
            case .lychee: "리치"
            case .mango: "망고"
            case .marinatedmeat: "절인 고기"
            case .marshmallow: "마시멜로"
            case .mint: "민트"
            case .mushroom: "버섯"
            case .nuts: "견과류"
            case .olive: "올리브"
            case .orange: "오렌지"
            case .oregano: "오레가노"
            case .peach: "복숭아"
            case .pear: "배"
            case .peat: "피트"
            case .pimento: "피망"
            case .pineapple: "파인애플"
            case .plum: "자두"
            case .pomegranate: "석류"
            case .popcorn: "팝콘"
            case .pumpkin: "호박"
            case .raisin: "건포도"
            case .raspberry: "산딸기"
            case .redgrape: "적포도"
            case .redpepper: "고추"
            case .rose: "장미"
            case .soil: "흙"
            case .smoke: "연기"
            case .strawberry: "딸기"
            case .sugar: "설탕"
            case .tomato: "토마토"
            case .vanilla: "바닐라"
            case .violet: "제비꽃"
            case .watermelon: "수박"
            case .wheat: "밀"
            case .wood: "나무"
            }
        }

        var uiImage: UIImage {
            switch self {
            case .acacia: .acacia
            case .apple: .apple
            case .apricot: .apricot
            case .banana: .banana
            case .bergamot: .bergamot
            case .blackpepper: .blackpepper
            case .blacktea: .blacktea
            case .blueberry: .blueberry
            case .bread: .bread
            case .butter: .butter
            case .carrot: .carrot
            case .cherry: .cherry
            case .chocolate: .chocolate
            case .cilantro: .cilantro
            case .cinnamon: .cinnamon
            case .coconut: .coconut
            case .coffee: .coffee
            case .coke: .coke
            case .cream: .cream
            case .cranberry: .cranberry
            case .ginger: .ginger
            case .grapefruit: .grapefruit
            case .greengrape: .greengrape
            case .greentea: .greentea
            case .honey: .honey
            case .iris: .iris
            case .kiwi: .kiwi
            case .jasmine: .jasmine
            case .lavender: .lavender
            case .leaf: .leaf
            case .leather: .leather
            case .lemon: .lemon
            case .lime: .lime
            case .lilac: .lilac
            case .lychee: .lychee
            case .mango: .mango
            case .marinatedmeat: .marinatedmeat
            case .marshmallow: .marshmallow
            case .mint: .mint
            case .mushroom: .mushroom
            case .nuts: .nuts
            case .olive: .olive
            case .orange: .orange
            case .oregano: .oregano
            case .peach: .peach
            case .pear: .pear
            case .peat: .peat
            case .pimento: .pimento
            case .pineapple: .pineapple
            case .plum: .plum
            case .pomegranate: .pomegranate
            case .popcorn: .popcorn
            case .pumpkin: .pumpkin
            case .raisin: .raisin
            case .raspberry: .raspberry
            case .redgrape: .redgrape
            case .redpepper: .redpepper
            case .rose: .rose
            case .soil: .soil
            case .smoke: .smoke
            case .strawberry: .strawberry
            case .sugar: .sugar
            case .tomato: .tomato
            case .vanilla: .vanilla
            case .violet: .violet
            case .watermelon: .watermelon
            case .wheat: .wheat
            case .wood: .wood
            }
        }
    }
}
