// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ProjectDescription

public extension TargetDependency {

    enum Common: String {
        case coralKit = "CoralKit"
        case coralUI = "CoralUI"
    }

}

public extension TargetDependency {

    static func common(_ target: Common) -> Self {
        return .project(
            target: target.rawValue,
            path: .relativeToRoot("Projects/Common/\(target.rawValue)")
        )
    }

}
