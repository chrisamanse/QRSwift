//
//  QRCodeGenerator.swift
//  QRSwift
//
//  Created by Chris Amanse on 05/05/2016.
//
//

import Foundation
import CoreImage

fileprivate enum Keys: String {
    case inputMessage
    case inputCorrectionLevel
}

/// The `QRCodeGenerator` class provides a QR Code generator.
public struct QRCodeGenerator {
    
    private let filter: CIFilter
    
    /// The correction level of the QR Code.
    public var correctionLevel: CorrectionLevel {
        didSet {
            filter.setValue(correctionLevel.rawValue, forKey: Keys.inputCorrectionLevel.rawValue)
        }
    }
    
    /// Create a `QRCodeGenerator` instance with a specified correction level.
    ///
    /// - parameter correctionLevel: The correction level for the QR Code. Default value is `M`.
    public init(correctionLevel: CorrectionLevel = .M) {
        filter = CIFilter(name: "CIQRCodeGenerator")!
        
        self.correctionLevel = correctionLevel
    }
    
    /// Generate QR Code image of type CIImage.
    ///
    /// - parameter data: The data to be encoded as a QR Code image.
    /// - parameter size: The target size of image. If set to `nil`, the size will be the smallest possible size. Default value is `nil`.
    ///
    /// - returns: The QR code image of type `CIImage`.
    public func CIImageFrom(_ data: Data, withSize size: CGSize? = nil) -> CIImage? {
        filter.setValue(data, forKey: Keys.inputCorrectionLevel.rawValue)
        
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


public extension QRCodeGenerator {
    /// Correction level options for `QRCodeGenerator`.
    public enum CorrectionLevel: String {
        case L, M, Q, H
    }
}
