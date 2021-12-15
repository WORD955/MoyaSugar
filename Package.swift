// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "MoyaSugar",
  platforms: [.iOS("13.0"),
              .macOS("10.15"),
              .tvOS("13.0"),
              .watchOS("6.0")],
  products: [
    .library(name: "MoyaSugar", targets: ["MoyaSugar"]),
  ],
  dependencies: [
    .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
  ],
  targets: [
    .target(name: "MoyaSugar", dependencies: ["Moya"])
  ]
)
