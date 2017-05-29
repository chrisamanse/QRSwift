//: Playground - noun: a place where people can play

import Foundation
import QRSwift

var str = "Hello, playground"

let data = str.data(using: .utf8) ?? Data()

let generator = QRCodeGenerator()

generator.image(with: data, outputImageSize: CGSize(width: 128, height: 128))
