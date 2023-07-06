// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ProjectDescription

public extension TargetDependency {

    enum Common: String {
        case coralKit = "CoralKit"
        case coralUI = "CoralUI"
    }

    enum Feature: String {
        case caseConverter = "CaseConverter"
        case colorConverter = "ColorConverter"
        case jsonFormatter = "JSONFormatter"
        case lineSorter = "LineSorter"
        case markdownPreview = "MarkdownPreview"
    }

    enum External: String {
        case dependencies = "Dependencies"
        case oneWay = "OneWay"
    }

}

public extension TargetDependency {

    static func common(_ target: Common) -> Self {
        return .project(
            target: target.rawValue,
            path: .relativeToRoot("Projects/Common/\(target.rawValue)")
        )
    }

    static func feature(_ target: Feature) -> Self {
        return .project(
            target: target.rawValue,
            path: .relativeToRoot("Projects/Features/\(target.rawValue)")
        )
    }

    static func external(_ target: External) -> Self {
        return .external(name: target.rawValue)
    }

}
