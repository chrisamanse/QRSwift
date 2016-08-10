//: Playground - noun: a place where people can play

import Foundation
import QRSwift

var message = "BEGIN:VCARD\nN:Amanse;Chris\nEND:VCARD"

let data = message.data(using: .utf8)!

data.count

let generator = QRCodeGenerator()

// QR Code CIImage with default size
generator.CIImageFrom(data)

// QR Code CIImage with configured size
generator.CIImageFrom(data, withSize: CGSize(width: 512, height: 512))
