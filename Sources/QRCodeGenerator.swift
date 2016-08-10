//
//  QRCodeGenerator.swift
//  QRSwift
//
//  Created by Chris Amanse on 05/05/2016.
//
//

import Foundation
import CoreImage

/// Correction level options for `QRCodeGenerator`.
public enum QRCodeGeneratorCorrectionLevel: String {
    case L, M, Q, H
}

private enum Keys: String {
    case inputMessage
    case inputCorrectionLevel
}

/// The `QRCodeGenerator` class provides a QR Code generator.
public class QRCodeGenerator {
    private let filter: CIFilter
    
    /// The correction level of the QR Code. Default value is `.M`.
    public var correctionLevel: QRCodeGeneratorCorrectionLevel = .M {
        didSet {
            filter.setValue(correctionLevel.rawValue, forKey: Keys.inputCorrectionLevel.rawValue)
        }
    }
    
    /// Create a QR Code generator instance
    public init() {
        filter = CIFilter(name: "CIQRCodeGenerator")!
        
        filter.setValue(correctionLevel.rawValue, forKey: Keys.inputCorrectionLevel.rawValue)
    }
    
    /**
     Generate QR Code image of type CIImage
     
     - parameters:
        - data: The data to be embedded in the QR Code image.
        - size: The target size of image. If set to `nil`, the size will be the smallest possible size. Default value is `nil`.
     
     - returns: QR Code image of type `CIImage`
    */
    public func CIImageFrom(_ data: Data, withSize size: CGSize? = nil) -> CIImage? {
        filter.setValue(data, forKey: "inputMessage")
        
        guard let image = filter.outputImage else {
            return nil
        }
        
        if let s = size {
            let scaleX = s.width / image.extent.width
            let scaleY = s.height / image.extent.height
            
            let scaleTransform = CGAffineTransform(scaleX: scaleX, y: scaleY)
            
            return image.applying(scaleTransform)
        } else {
            return image
        }
    }
}
