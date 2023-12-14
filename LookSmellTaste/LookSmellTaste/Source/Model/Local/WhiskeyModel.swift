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
