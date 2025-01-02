// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppCore",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .singleTargetLybrary(name: "CoreUI"),
        .singleTargetLybrary(name: "CoreNetwork"),
        .singleTargetLybrary(name: "CoreModel")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "CoreUI", dependencies: ["CoreModel"], resources: [.process("Resources/Media.xcassets")]),
        .target(name: "CoreNetwork"),
        .target(name: "CoreModel"),
        .testTarget(
            name: "AppCoreTests",
            dependencies: ["CoreNetwork", "CoreModel"]
        ),
    ]
)

extension Product {
    static func singleTargetLybrary(name: String) -> Product {
        .library(name: name, targets: [name])
    }
}
