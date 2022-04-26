// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Corpus",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Corpus",
            targets: ["Corpus"]),
    ],
    dependencies: [
        .package(name: "Dictionary", url: "https://github.com/StarlangSoftware/Dictionary-Swift.git", .exact("1.0.10")),
        .package(name: "DataStructure", url: "https://github.com/StarlangSoftware/DataStructure-Swift.git", .exact("1.0.4")),
        .package(name: "Util", url: "https://github.com/StarlangSoftware/Util-Swift.git", .exact("1.0.8")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Corpus",
            dependencies: ["Dictionary", "DataStructure", "Util"],
            resources: [.process("corpus.txt"),.process("simplecorpus.txt")]),
        .testTarget(
            name: "CorpusTests",
            dependencies: ["Corpus"]),
    ]
)
