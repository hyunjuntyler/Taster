//
//  User.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 11/25/23.
//

import SwiftData
import SwiftUI

@Model
final class User {
    @Attribute(.unique) var id = UUID()
    var name: String

    init(name: String) {
        self.name = name
    }
}
