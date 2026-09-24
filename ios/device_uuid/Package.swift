// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "device_uuid",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "device-uuid", targets: ["device_uuid"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "XYUUID",
            path: "Sources/XYUUID",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include/XYUUID")
            ],
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("AppTrackingTransparency"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("Security")
            ]
        ),
        .target(
            name: "device_uuid",
            dependencies: [
                "XYUUID",
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            path: "Sources/device_uuid",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include/device_uuid")
            ]
        )
    ]
)
