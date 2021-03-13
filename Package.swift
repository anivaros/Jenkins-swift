// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Jenkins",
    products: [
        .library(
            name: "Jenkins",
            targets: ["Jenkins"]
        )
    ],
    targets: [
        .target(
            name: "Jenkins",
            dependencies: []
        ),
        .testTarget(
            name: "JenkinsTests",
            dependencies: ["Jenkins"]
        ),
    ]
)
