// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ProjectDescription

extension Scheme {

    static func debug(name: String) -> Self {
        return Scheme(
            name: "\(name)-Debug",
            shared: true,
            buildAction: BuildAction(targets: ["\(name)"]),
            testAction: .targets(
                [
                    TestableTarget(
                        target: TargetReference(stringLiteral: "\(name)Tests"),
                        parallelizable: true
                    )
                ],
                options: .options(
                    language: nil,
                    region: nil,
                    coverage: true,
                    codeCoverageTargets: ["\(name)"]
                )
            ),
            runAction: .runAction(
                configuration: "Debug",
                executable: "\(name)"
            )
        )
    }

    static func release(name: String) -> Self {
        return Scheme(
            name: name,
            shared: true,
            buildAction: BuildAction(targets: ["\(name)"]),
            testAction: .targets(
                [
                    TestableTarget(
                        target: TargetReference(stringLiteral: "\(name)Tests"),
                        parallelizable: true
                    )
                ],
                options: .options(
                    language: nil,
                    region: nil,
                    coverage: false,
                    codeCoverageTargets: []
                )
            ),
            runAction: .runAction(
                configuration: "Release",
                executable: "\(name)"
            )
        )
    }

}
