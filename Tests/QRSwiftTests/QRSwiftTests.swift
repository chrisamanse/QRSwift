import XCTest
import CoreImage
@testable import QRSwift

class QRSwiftTests: XCTestCase {
    func testQRCodeGenerateWithSmallestPossibleSize() {
        let data = Data()
        let qrCodeGenerator = QRCodeGenerator()
        let image = qrCodeGenerator.image(with: data)
        
        XCTAssertNotNil(image)
        XCTAssertNotEqual(image?.extent.size, .zero)
    }
    
    func testQRCodeGenerateWithScaledSize() {
        let data = Data()
        let qrCodeGenerator = QRCodeGenerator()
        let image = qrCodeGenerator.image(with: data, outputImageSize: CGSize(width: 127, height: 127))
        
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.extent.size, CGSize(width: 127, height: 127))
    }
    
    func testQRCodeGeneratorCorrectionLevel() {
        var qrCodeGenerator = QRCodeGenerator(correctionLevel: .L)
        var value = qrCodeGenerator.filter.value(forKey: QRCodeGenerator.Constants.inputCorrectionLevel) as? String
        
        XCTAssertEqual(qrCodeGenerator.correctionLevel, .L)
        XCTAssertEqual(value, QRCodeGenerator.CorrectionLevel.L.rawValue)
        
        qrCodeGenerator.correctionLevel = .M
        value = qrCodeGenerator.filter.value(forKey: QRCodeGenerator.Constants.inputCorrectionLevel) as? String
        
        XCTAssertEqual(qrCodeGenerator.correctionLevel, .M)
        XCTAssertEqual(value, QRCodeGenerator.CorrectionLevel.M.rawValue)
        
        qrCodeGenerator.correctionLevel = .H
        value = qrCodeGenerator.filter.value(forKey: QRCodeGenerator.Constants.inputCorrectionLevel) as? String
        
        XCTAssertEqual(qrCodeGenerator.correctionLevel, .H)
        XCTAssertEqual(value, QRCodeGenerator.CorrectionLevel.H.rawValue)
    }
    
    func testQRCodeGeneratorWithTooLargeMessage() {
        let data = String(Array<Character>(repeating: "A", count: 10_000)).data(using: .utf8)!
        let qrCodeGenerator = QRCodeGenerator(correctionLevel: .H)
        let image = qrCodeGenerator.image(with: data)
        
        XCTAssertNil(image)
    }
    
    func testQRCodeGeneratorWithTooLargeMessageScaledSize() {
        let data = String(Array<Character>(repeating: "A", count: 10_000)).data(using: .utf8)!
        let qrCodeGenerator = QRCodeGenerator(correctionLevel: .H)
        let image = qrCodeGenerator.image(with: data, outputImageSize: CGSize(width: 1023, height: 1023))
        
        XCTAssertNil(image)
    }
    
    static var allTests : [(String, (QRSwiftTests) -> () throws -> Void)] {
        return [
            ("testQRCodeGenerateWithSmallestPossibleSize", testQRCodeGenerateWithSmallestPossibleSize),
            ("testQRCodeGenerateWithScaledSize", testQRCodeGenerateWithScaledSize),
            ("testQRCodeGeneratorCorrectionLevel", testQRCodeGeneratorCorrectionLevel),
            ("testQRCodeGeneratorWithTooLargeMessage", testQRCodeGeneratorWithTooLargeMessage),
            ("testQRCodeGeneratorWithTooLargeMessageScaledSize", testQRCodeGeneratorWithTooLargeMessageScaledSize)
        ]
    }
}
