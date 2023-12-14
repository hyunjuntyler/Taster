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
