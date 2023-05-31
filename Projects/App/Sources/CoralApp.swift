// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import SwiftUI

@main
struct CoralApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(
                    \.managedObjectContext,
                    persistenceController.container.viewContext
                )
        }
    }
}
