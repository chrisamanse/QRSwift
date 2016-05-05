# QRSwift

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

// Encode message into NSData
let data = message.dataUsingEncoding(NSUTF8StringEncoding)!

// Create generator object
let generator = QRCodeGenerator()

// Set correction level of QR Code - .L, .M, .Q, or .H
// Default value of .M
generator.correctionLevel = .M

// QR Code CIImage with default size
let image = generator.CIImageFrom(data)

// QR Code CIImage with configured size
let largeImage = generator.CIImageFrom(data, withSize: CGSize(width: 512, height: 512))

```

# LICENSE

Copyright (c) 2016 Joe Christopher Paul Amanse

This software is distributed under the [MIT License](./LICENSE).
