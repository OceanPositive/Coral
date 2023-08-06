// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import AppKit
import Foundation

public enum DeviceUtil {

    public enum Pastboard {
        public static func saveOnPasteboard(_ string: String) {
            let pasteboard = NSPasteboard.general
            pasteboard.declareTypes([.string], owner: nil)
            pasteboard.setString(string, forType: .string)
        }
    }

}
