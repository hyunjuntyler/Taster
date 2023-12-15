//
//  FilterModel.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/15/23.
//

import SwiftUI

enum SortOption {
    case mostRecent
    case oldestFirst
    case highestRated
    case lowestRated
}

struct FilterModel: Identifiable {
    var id = UUID()
    var label: String
    var sort: SortOption
}

let filters = [
    FilterModel(label: "최신순", sort: .mostRecent),
    FilterModel(label: "오래된 순", sort: .oldestFirst),
    FilterModel(label: "별점 높은순", sort: .highestRated),
    FilterModel(label: "별점 낮은순", sort: .lowestRated),
]
