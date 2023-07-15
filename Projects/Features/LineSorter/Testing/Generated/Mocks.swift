public enum Mocks {

    public enum Import {

        public static let input: String =
            """
            import CoralKit
            import OneWay
            import Foundation
            import zyx
            import AppKit
            import ABCD
            """

        public static let alphabeticallyOrdered: String =
            """
            import ABCD
            import AppKit
            import CoralKit
            import Foundation
            import OneWay
            import zyx
            """

        public static let alphabeticallyReversed: String =
            """
            import zyx
            import OneWay
            import Foundation
            import CoralKit
            import AppKit
            import ABCD
            """

        public static let lenghtlyOrdered: String =
            """
            import zyx
            import ABCD
            import OneWay
            import AppKit
            import CoralKit
            import Foundation
            """

        public static let lenghtlyReversed: String =
            """
            import Foundation
            import CoralKit
            import AppKit
            import OneWay
            import ABCD
            import zyx
            """

    }

    public enum Number {

        public static let input: String =
            """
            Prefix-123
            Prefix-2352
            Prefix-235623
            Prefix-459595
            Prefix-11111
            Prefix-124
            """

        public static let alphabeticallyOrdered: String =
            """
            Prefix-11111
            Prefix-123
            Prefix-124
            Prefix-2352
            Prefix-235623
            Prefix-459595
            """

        public static let alphabeticallyReversed: String =
            """
            Prefix-459595
            Prefix-235623
            Prefix-2352
            Prefix-124
            Prefix-123
            Prefix-11111
            """

        public static let lenghtlyOrdered: String =
            """
            Prefix-123
            Prefix-124
            Prefix-2352
            Prefix-11111
            Prefix-235623
            Prefix-459595
            """

        public static let lenghtlyReversed: String =
            """
            Prefix-459595
            Prefix-235623
            Prefix-11111
            Prefix-2352
            Prefix-124
            Prefix-123
            """

    }

}
