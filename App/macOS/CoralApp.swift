// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralUI
import SwiftUI

@main
struct CoralApp: App {

    var body: some Scene {
        WindowGroup {
            CoralView()
        }
        .commands {
            CoralCommands()
        }

        Settings {
            CoralSettings()
        }
    }

}
