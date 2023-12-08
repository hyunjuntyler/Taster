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
        user.wineNotes = [WineNote(name: "와인 샘플", date: Date(), type: wineTypes[0], color: wineColors[0], scents: [wineScents[0], wineScents[1]], taste: [5, 4, 3, 2, 3], think: "와인 후기", rating: 4.5)]
        return [user]
    }()
}
