// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CoralUI
import Factory
import Foundation
import LineSorter
import LineSorterInterface

public final class LineSorterContainer: SharedContainer {

    public static let shared = LineSorterContainer()
    public let manager = ContainerManager()

}

extension LineSorterContainer {

    public var lineSorterBuilder: Factory<AnyViewBuilder<LineSorterDependency>> {
        self { AnyViewBuilder(LineSorterBuilder()) }
    }

}
