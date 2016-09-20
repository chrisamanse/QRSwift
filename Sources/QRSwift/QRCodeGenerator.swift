//
//  QRCodeGenerator.swift
//  QRSwift
//
//  Created by Chris Amanse on 09/20/2016.
//
//

import Foundation
import CoreImage


/// Generates QR code images from a message, with customizable correction level and image size.
public struct QRCodeGenerator {
    
    /// A `CIFilter` of type "CIQRCodeGenerator".
    private let filter: CIFilter
    
    /// Creates a QR code generator using the `CIFilter` API.
    public init() {
        filter = CIFilter(name: Constants.filterName)!
    }
    
    /// Get the QR code image reprentation of `message`, with defined correction level and size.
    ///
    /// - parameters:
    ///   - message:         The data to be encoded in the QR code image.
    ///   - correctionLevel: The correction level for the QR code. Default value is `M`.
    ///   - size:            The output size of the QR code image. If set to `nil`, the size will be the smallest possible size. Default value is `nil`.
    ///
    /// - throws: A `QRCodeGeneratorError` case.
    ///
    /// - returns: The QR code image of type `CIImage`.
    public func outputImage(message: Data, correctionLevel: CorrectionLevel = .M, size: CGSize? = nil) throws -> CIImage {
        filter.setValue(message, forKey: Constants.inputMessage)
        filter.setValue(correctionLevel.rawValue, forKey: Constants.inputCorrectionLevel)
        
        // If failed to create image, it means data is too big
        guard let image = filter.outputImage else {
            throw QRCodeGeneratorError.dataTooBig
        }
        
        // If no size provided, return image with default size
        guard let outputSize = size else {
            return image
        }
        
        // If size is provided, scale to output size
        let scaleTransform = CGAffineTransform(scaleX: outputSize.width / image.extent.width,
                                               y: outputSize.height / image.extent.height)
        
        // Return scaled image
        return image.applying(scaleTransform)
    }
}

public extension QRCodeGenerator {
    /// Correction level options for `QRCodeGenerator`.
    public enum CorrectionLevel: String {
        case L, M, Q, H
    }
}

/// Error cases for `QRCodeGenerator`
///
/// - dataTooBig: Data can't fit in the QR code
public enum QRCodeGeneratorError: Error {
    case dataTooBig
}

fileprivate struct Constants {
    
    /// Filter name
    static var filterName: String {
        return "CIQRCodeGenerator"
    }
    
    /// Input message key
    static var inputMessage: String {
        return "inputMessage"
    }
    
    /// Input correction level key
    static var inputCorrectionLevel: String {
        return "inputCorrectionLevel"
    }
}
