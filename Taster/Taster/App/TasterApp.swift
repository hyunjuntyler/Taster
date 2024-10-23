//
//  Taster.swift
//  Taster
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI
import SwiftData

@main
struct TasterApp: App {
    var container: ModelContainer
    
    init() {
#if DEBUG
        container = SchemaV2.previewContainer
#else
        let schema = Schema(versionedSchema: SchemaV2.self)
        let migrationPlan = MigrationPlan.self
        
        do {
            container = try ModelContainer(
                for: schema,
                migrationPlan: migrationPlan
            )
        } catch {
            fatalError(error.localizedDescription)
        }
#endif
    }
    
    var body: some Scene {
        WindowGroup {
            Content()
                .modelContainer(container)
        }
    }
}
