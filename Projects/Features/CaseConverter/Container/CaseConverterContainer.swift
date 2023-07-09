// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CaseConverter
import CaseConverterInterface
import CoralUI
import Factory
import Foundation

public final class CaseConverterContainer: SharedContainer {

    public static let shared = CaseConverterContainer()
    public let manager = ContainerManager()

}

extension CaseConverterContainer {

    public var caseConverterBuilder: Factory<AnyViewBuilder<CaseConverterDependency>> {
        self { AnyViewBuilder(CaseConverterBuilder()) }
    }

}
