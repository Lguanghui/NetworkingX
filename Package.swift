// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkingX",
    platforms: [.macOS(.v15), .iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NetworkingX",
            targets: ["NetworkingX"]),
    ],
    dependencies: [.package(url: "https://github.com/Lguanghui/FoundationX.git", branch: "master"),
                   .package(url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.8.1"))],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NetworkingX",
            dependencies: ["Alamofire", "FoundationX"]),
        .testTarget(
            name: "NetworkingXTests",
            dependencies: ["NetworkingX"]),
    ]
)
