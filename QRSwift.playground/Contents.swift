//: Playground - noun: a place where people can play

import Foundation
import QRSwift

var str = "Hello, playground"

let data = str.data(using: .utf8) ?? Data()

let generator = QRCodeGenerator()

do {
    let image = try generator.outputImage(message: data)
    
    let enlargedImage = try generator.outputImage(message: data, size: CGSize(width: 64, height: 64))
} catch QRCodeGeneratorError.dataTooBig {
    print("Data too big!")
}
