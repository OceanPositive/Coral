// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Foundation

public enum Coral {

    public static let organizationName: String = "enuf.com"
    public static let fileHeader: String = """
    // The MIT License (MIT)
    //
    // https://github.com/DevYeom/Coral
    """

    static func bundleId(_ value: String) -> String {
        "com.enuf.\(value)"
    }

}


