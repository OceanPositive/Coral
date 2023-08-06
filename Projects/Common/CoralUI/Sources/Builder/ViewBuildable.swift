// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import Foundation
import SwiftUI

public protocol ViewBuildable {

    associatedtype Dependency

    func callAsFunction(_ dependency: Dependency) -> AnyView

}
