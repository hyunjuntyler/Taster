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
        enum Category: String, CustomStringConvertible {
            case sparklingWine, whiteWine, redWine, naturalWine, dessertWine, roseWine, orangeWine, portWine, champagne, otherWine
            
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
                }
            }
        }
        
        static let looks: [Look] = [
            .straw, .yellow, .gold, .amber, .brown, .copper, .salmon, .pink, .ruby, .purple, .garnet, .tawny
        ]
        
        static let smells: [Smell] = [
            .blueberry, .olive, .plum, .cherry, .cranberry, .pomegranate, .raspberry, .strawberry, .tomato, .kiwi, .mango, .pineapple, .apple, .apricot, .peach, .grapefruit, .lemon, .lime, .orange, .acacia, .iris, .jasmine, .lavender, .lilac, .rose, .violet, .blacktea, .mint, .oregano, .cinnamon, .blackpepper, .redpepper, .butter, .soil, .marinatedmeat, .mushroom, .smoke, .chocolate, .coffee, .leather, .nuts, .coconut, .coke, .vanilla
        ]
    }
    
    enum Coffee {
        enum Category: String, CustomStringConvertible {
            case dripCoffee, capsuleCoffee, cafeCoffee, homeCoffee
            
            var description: String {
                switch self {
                case .dripCoffee: "드립 커피"
                case .capsuleCoffee: "캡슐 커피"
                case .cafeCoffee: "카페 커피"
                case .homeCoffee: "홈 커피"
                }
            }
            
            var uiImage: UIImage {
                switch self {
                case .dripCoffee: .dripCoffee
                case .capsuleCoffee: .capsuleCoffee
                case .cafeCoffee: .cafeCoffee
                case .homeCoffee: .homeCoffee
                }
            }
        }
        
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
        enum Category: String, CustomStringConvertible {
            case blendedWhiskey, bourbonWhiskey, canadianWhiskey, cornWhiskey, grainWhiskey, irishWhiskey, japaneseWhiskey, otherWhiskey, potstillWhiskey, ryeWhiskey, scotchWhiskey, singlemaltWhiskey, tennesseeWhiskey, whiteWhiskey
            
            var description: String {
                switch self {
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
                }
            }
            
            var uiImage: UIImage {
                switch self {
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
                }
            }
        }
        
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
        enum Category: String, CustomStringConvertible {
            case homeCocktail, barCocktail
            
            var description: String {
                switch self {
                case .homeCocktail: "홈 칵테일"
                case .barCocktail: "바 칵테일"
                }
            }
            
            var uiImage: UIImage {
                switch self {
                case .homeCocktail: .homeCocktail
                case .barCocktail: .barCocktail
                }
            }
        }
        
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
    
    enum Look {
        case straw, yellow, gold, amber, brown, copper, salmon, pink, ruby, purple, garnet, tawny, oak, burgundy, rust
        
        var uiColor: UIColor {
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
    
    enum Smell {
        case acacia, apple, apricot, banana, bergamot, blackpepper, blacktea, blueberry, bread, butter, carrot, cherry, chocolate, cilantro, cinnamon, coconut, coffee, coke, cream, cranberry, ginger, grapefruit, greengrape, greentea, honey, iris, kiwi, jasmine, lavender, leaf, leather, lemon, lime, lilac, lychee, mango, marinatedmeat, marshmallow, mint, mushroom, nuts, olive, orange, oregano, peach, pear, peat, pimento, pineapple, plum, pomegranate, popcorn, pumpkin, raisin, raspberry, redgrape, redpepper, rose, soil, smoke, strawberry, sugar, tomato, vanilla, violet, watermelon, wheat, wood

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
