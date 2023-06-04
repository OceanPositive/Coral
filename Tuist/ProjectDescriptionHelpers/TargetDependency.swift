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
        case colorConverter = "ColorConverter"
    }

    enum External: String {
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
