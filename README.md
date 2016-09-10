# QRSwift
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/QRSwift.svg)](https://github.com/CocoaPods/CocoaPods)
[![Platform](https://img.shields.io/cocoapods/p/QRSwift.svg?style=flat)](http://cocoadocs.org/docsets/QRSwift)

QRSwift is a Swift framework for generating QR codes.

# Installation

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

// Create generator object
let generator = QRCodeGenerator(correctionLevel: .M)

// QR Code CIImage with default size
let image = generator.CIImageFrom(data)

// QR Code CIImage with configured size
let largeImage = generator.CIImageFrom(data, withSize: CGSize(width: 512, height: 512))

```

# License

Copyright (c) 2016 Joe Christopher Paul Amanse

This software is distributed under the [MIT License](./LICENSE).
