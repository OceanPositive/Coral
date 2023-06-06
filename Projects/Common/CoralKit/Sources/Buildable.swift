// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Foundation

public protocol Buildable {

    associatedtype ReturnType
    associatedtype Dependency

    func callAsFunction(_ dependency: Dependency) -> ReturnType

}
