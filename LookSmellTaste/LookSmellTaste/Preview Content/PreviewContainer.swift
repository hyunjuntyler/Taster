//
//  PreviewContainer.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/8/23.
//

import Foundation
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    
    do {
        let container = try ModelContainer(for: User.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        container.mainContext.insert(SampleData.user.first ?? User(name: "에러", icon: "☠️"))
        return container
    } catch {
        fatalError("Failed to create container.")
    }
}()

struct SampleData {
    static let user: [User] = {
        let user = User(name: "유저", icon: "🦊")
        user.wineNotes = [
            WineNote(name: "와인 샘플1", date: Date(), type: wineTypes[0], color: wineColors[4], scents: [wineScents[2], wineScents[6]], taste: [5, 4, 3, 2, 3], think: "와인 후기", rating: 3.5),
            WineNote(name: "와인 샘플2", date: Date() - 100, type: wineTypes[1], color: wineColors[2], scents: [wineScents[1], wineScents[3]], taste: [5, 1, 5, 2, 1], think: "와인 후기", rating: 4.5)
        ]
        user.coffeeNotes = [
            CoffeeNote(name: "커피 샘플1", date: Date() - 1000, type: coffeeTypes[0], flavors: [coffeeFlavors[0], coffeeFlavors[6]], taste: [5, 4, 3, 3, 4], think: "커피 후기1", rating: 4.5),
            CoffeeNote(name: "커피 샘플2", date: Date(), type: coffeeTypes[2], flavors: [coffeeFlavors[1], coffeeFlavors[3]], taste: [3, 4, 3, 3, 4], think: "커피 후기2", rating: 3.5)
        ]
        return [user]
    }()
}
