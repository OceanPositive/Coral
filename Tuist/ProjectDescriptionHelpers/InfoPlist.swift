// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ProjectDescription

extension InfoPlist {

    public static let app: Self = .dictionary([
        "CFBundleShortVersionString": "$(MARKETING_VERSION)",
        "CFBundleIdentifier": "$(CORAL_BUNDLE_IDENTIFIER)",
        "CFBundleName": "$(PRODUCT_NAME)",
        "CFBundleDisplayName": "$(CORAL_DISPLAY_NAME)",
        "CFBundleInfoDictionaryVersion": "6.0",
        "CFBundleDevelopmentRegion": "$(DEVELOPMENT_LANGUAGE)",
        "NSHumanReadableCopyright": "",
        "CFBundleExecutable": "$(EXECUTABLE_NAME)",
        "CFBundleVersion": "$(CURRENT_PROJECT_VERSION)",
        "CFBundlePackageType": "$(PRODUCT_BUNDLE_PACKAGE_TYPE)",
        "ITSAppUsesNonExemptEncryption": false,
        "NSAppTransportSecurity": [
            "NSAllowsArbitraryLoads": true,
            "NSAllowsArbitraryLoadsForMedia": true,
            "NSAllowsArbitraryLoadsInWebContent": true,
        ],
    ])

}
