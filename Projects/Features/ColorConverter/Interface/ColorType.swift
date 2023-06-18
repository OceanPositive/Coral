// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Foundation

public protocol ColorType {

    associatedtype C: ColorConvertible

    var sourceColor: C { get }

}
