// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Coral",
    platforms: [
        .macOS(.v14),
    ],
    products: Module.allCases.map { $0.library },
    dependencies: [
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.0.0"),
        .package(url: "https://github.com/DevYeom/OneWay.git", from: "2.0.0"),
        .package(url: "https://github.com/gonzalezreal/swift-markdown-ui", from: "2.0.0"),
    ],
    targets: Module.allCases.flatMap { $0.targets }
)

enum Module: String, CaseIterable {
    case coralKit = "CoralKit"
    case coralUI = "CoralUI"
    case caseConverter = "CaseConverter"
    case colorConverter = "ColorConverter"
    case jsonFormatter = "JSONFormatter"
    case lineSorter = "LineSorter"
    case markdownPreview = "MarkdownPreview"

    var library: Product {
        .library(
            name: rawValue,
            targets: [rawValue]
        )
    }

    var targets: [Target] {
        switch self {
        case .coralKit:
            return [
                .target(
                    name: "CoralKit",
                    dependencies: []
                ),
                .testTarget(
                    name: "CoralKitTests",
                    dependencies: ["CoralKit"]
                ),
            ]
        case .coralUI:
            return [
                .target(
                    name: "CoralUI",
                    dependencies: []
                ),
                .testTarget(
                    name: "CoralUITests",
                    dependencies: ["CoralUI"]
                ),
            ]
        case .caseConverter:
            return [
                .target(
                    name: "CaseConverter",
                    dependencies: [
                        "CoralKit",
                        "CoralUI",
                        "Factory",
                        "OneWay",
                    ]
                ),
                .testTarget(
                    name: "CaseConverterTests",
                    dependencies: ["CaseConverter"]
                ),
            ]
        case .colorConverter:
            return [
                .target(
                    name: "ColorConverter",
                    dependencies: [
                        "CoralKit",
                        "CoralUI",
                        "Factory",
                        "OneWay",
                    ]
                ),
                .testTarget(
                    name: "ColorConverterTests",
                    dependencies: ["ColorConverter"]
                ),
            ]
        case .jsonFormatter:
            return [
                .target(
                    name: "JSONFormatter",
                    dependencies: [
                        "CoralKit",
                        "CoralUI",
                        "Factory",
                        "OneWay",
                    ]
                ),
                .testTarget(
                    name: "JSONFormatterTests",
                    dependencies: ["JSONFormatter"]
                ),
            ]
        case .lineSorter:
            return [
                .target(
                    name: "LineSorter",
                    dependencies: [
                        "CoralKit",
                        "CoralUI",
                        "Factory",
                        "OneWay",
                    ]
                ),
                .testTarget(
                    name: "LineSorterTests",
                    dependencies: ["LineSorter"]
                ),
            ]
        case .markdownPreview:
            return [
                .target(
                    name: "MarkdownPreview",
                    dependencies: [
                        "CoralKit",
                        "CoralUI",
                        "Factory",
                        "OneWay",
                        .product(
                            name: "MarkdownUI",
                            package: "swift-markdown-ui"
                        ),
                    ]
                ),
                .testTarget(
                    name: "MarkdownPreviewTests",
                    dependencies: ["MarkdownPreview"]
                ),
            ]
        }
    }
}
