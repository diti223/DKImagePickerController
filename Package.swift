// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DKImagePickerController",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(
            name: "DKImagePickerController",
            targets: ["DKImagePickerController"]),
    ],
    dependencies: [
        .package(url: "https://github.com/diti223/DKCamera.git", from: "1.7.0"),
        .package(url: "https://github.com/diti223/DKPhotoGallery.git", from: "1.0.0"),
        .package(url: "https://github.com/TimOliver/TOCropViewController.git", from: "2.6.0"),
    ],
    targets: [
        .target(
            name: "DKImagePickerController",
            dependencies: ["DKCamera", "DKPhotoGallery", "TOCropViewController"],
            path: "Sources",
            exclude: [
                "DKImagePickerController/Info.plist"
            ]),
    ]
)
