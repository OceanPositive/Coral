// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CoralUI
import Factory
import Foundation
import JSONFormatter
import JSONFormatterInterface

public final class JSONFormatterContainer: SharedContainer {

    public static let shared = JSONFormatterContainer()
    public let manager = ContainerManager()

}

extension JSONFormatterContainer {

    public var jsonFormatterBuilder: Factory<AnyViewBuilder<JSONFormatterDependency>> {
        self { AnyViewBuilder(JSONFormatterBuilder()) }
    }

}
