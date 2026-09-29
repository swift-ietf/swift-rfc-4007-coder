// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-rfc-4007-coder",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "RFC 4007 Coder",
            targets: ["RFC 4007 Coder"]
        ),
        .library(
            name: "RFC 4007 Coder Foundation Integration",
            targets: ["RFC 4007 Coder Foundation Integration"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-ascii.git", branch: "main", traits: ["Parser", "Serializer"]),
        .package(url: "https://github.com/swift-atoms/swift-byte.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-coder.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-cursor.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-parser.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-serializer.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-4007.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-4291.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-4291-coder.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-5952.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-5952-coder.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-binary.git", branch: "main", traits: ["Serializer"]),
    ],
    targets: [
        .target(
            name: "RFC 4007 Coder",
            dependencies: [
                .product(name: "ASCII", package: "swift-ascii"),
                .product(name: "Byte", package: "swift-byte"),
                .product(name: "Byte", package: "swift-byte"),
                .product(name: "Coder", package: "swift-coder"),
                .product(name: "Cursor", package: "swift-cursor"),
                .product(name: "Cursor", package: "swift-cursor"),
                .product(name: "Parser", package: "swift-parser"),
                .product(name: "RFC 4007", package: "swift-rfc-4007"),
                .product(name: "RFC 4291", package: "swift-rfc-4291"),
                .product(name: "RFC 4291 Coder", package: "swift-rfc-4291-coder"),
                .product(name: "RFC 5952", package: "swift-rfc-5952"),
                .product(name: "RFC 5952 Coder", package: "swift-rfc-5952-coder"),
                .product(name: "Serializer", package: "swift-serializer"),
                .product(name: "Binary", package: "swift-binary"),
            ]
        ),
        .testTarget(
            name: "RFC 4007 Coder Tests",
            dependencies: [
                "RFC 4007 Coder",
                .product(name: "ASCII", package: "swift-ascii"),
                .product(name: "Byte", package: "swift-byte"),
                .product(name: "Byte", package: "swift-byte"),
                .product(name: "Coder", package: "swift-coder"),
                .product(name: "Coder", package: "swift-coder"),
                .product(name: "Cursor", package: "swift-cursor"),
                .product(name: "Parser", package: "swift-parser"),
                .product(name: "RFC 4007", package: "swift-rfc-4007"),
                .product(name: "RFC 4291", package: "swift-rfc-4291"),
                .product(name: "RFC 4291 Coder", package: "swift-rfc-4291-coder"),
                .product(name: "RFC 5952 Coder", package: "swift-rfc-5952-coder"),
                .product(name: "Serializer", package: "swift-serializer"),
                .product(name: "Binary", package: "swift-binary"),
            ]
        ),
        .target(
            name: "RFC 4007 Coder Foundation Integration",
            dependencies: [
                "RFC 4007 Coder",
                .product(name: "ASCII", package: "swift-ascii"),
                .product(name: "Byte", package: "swift-byte"),
                .product(name: "RFC 4007", package: "swift-rfc-4007"),
                .product(name: "RFC 4291", package: "swift-rfc-4291"),
                .product(name: "RFC 4291 Coder", package: "swift-rfc-4291-coder"),
                .product(name: "RFC 5952 Coder", package: "swift-rfc-5952-coder"),
                .product(name: "Serializer", package: "swift-serializer"),
            ]
        ),
        .testTarget(
            name: "RFC 4007 Coder Foundation Integration Tests",
            dependencies: [
                "RFC 4007 Coder Foundation Integration",
                .product(name: "RFC 4007", package: "swift-rfc-4007"),
                .product(name: "RFC 4291", package: "swift-rfc-4291"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
