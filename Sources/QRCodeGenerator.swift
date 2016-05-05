//
//  QRCodeGenerator.swift
//  QRSwift
//
//  Created by Chris Amanse on 05/05/2016.
//
//

import Foundation
import CoreImage

public enum QRCodeGeneratorCorrectionLevel: String {
    case L, M, Q, H
}

private enum Keys: String {
    case inputMessage
    case inputCorrectionLevel
}

public class QRCodeGenerator {
    let filter: CIFilter
    
    public var correctionLevel: QRCodeGeneratorCorrectionLevel = .M {
        didSet {
            filter.setValue(correctionLevel.rawValue, forKey: Keys.inputCorrectionLevel.rawValue)
        }
    }
    
    public init() {
        filter = CIFilter(name: "CIQRCodeGenerator")!
        
        filter.setValue(correctionLevel.rawValue, forKey: Keys.inputCorrectionLevel.rawValue)
    }
    
    public func CIImageFrom(data: NSData, withSize size: CGSize? = nil) -> CIImage? {
        filter.setValue(data, forKey: "inputMessage")
        
        guard let image = filter.outputImage else {
            return nil
        }
        
        if let s = size {
            let scaleX = s.width / image.extent.width
            let scaleY = s.height / image.extent.height
            
            return image.imageByApplyingTransform(CGAffineTransformMakeScale(scaleX, scaleY))
        } else {
            return image
        }
    }
}
