// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "CryptoverviewWebsite",
    products: [
        .executable(
            name: "CryptoverviewWebsite",
            targets: ["CryptoverviewWebsite"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.7.0")
    ],
    targets: [
        .target(
            name: "CryptoverviewWebsite",
            dependencies: ["Publish"]
        )
    ]
)