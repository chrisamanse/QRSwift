# QRSwift
[![Build Status](https://travis-ci.org/chrisamanse/QRSwift.svg?branch=master)](https://travis-ci.org/chrisamanse/QRSwift)
![Swift Version](https://img.shields.io/badge/swift-3.0-orange.svg)
[![spm compatible](https://img.shields.io/badge/spm-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift-package-manager)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/QRSwift.svg)](https://github.com/CocoaPods/CocoaPods)
![Platform](https://img.shields.io/badge/platform-ios%20%7C%20macos%20%7C%20linux-lightgrey.svg)

QRSwift is a Swift framework for generating QR codes.

# Installation

## [Swift Package Manager](https://github.com/apple/swift-package-manager)

Add `.Package(url: "https://github.com/chrisamanse/QRSwift.git", majorVersion: 0)` in the dependencies of your Package or Target, then run `swift package update`.


## [CocoaPods](https://github.com/CocoaPods/CocoaPods)

Add `pod 'QRSwift'` to your target in your `Podfile`, then run `pod install`.

## [Carthage](https://github.com/Carthage/Carthage)

Add this to your `Cartfile`:

```
github "chrisamanse/QRSwift"
```

Then run:

```
$ carthage update
```

# Usage

```swift

var message = "Hello, World!"

// Encode message as Data
let data = message.data(using: .utf8)!

// Create a QR code generator instance
let generator = QRCodeGenerator()

// QR Code CIImage with default correction level and size
let image = try? generator.outputImage(message: data)

// Configured correction level and output image size
let configuredImage = try? generator.outputImage(message: data, correctionLevel: .M, size: CGSize(width: 512, height: 512))

```

# License

Copyright (c) 2016 Joe Christopher Paul Amanse

This software is distributed under the [MIT License](./LICENSE).
