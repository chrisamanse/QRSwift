import XCTest
import CoreImage
@testable import QRSwift

class QRSwiftTests: XCTestCase {
    func testQRCodeSize() {
        let str = "Hello, playground"
        
        let data = str.data(using: .utf8) ?? Data()
        
        let generator = QRCodeGenerator()
        
        do {
            let image = try generator.outputImage(message: data)
            XCTAssertEqual(image.extent.size, CGSize(width: 27, height: 27))
            
            let enlargedImage = try generator.outputImage(message: data, size: CGSize(width: 64, height: 64))
            XCTAssertEqual(enlargedImage.extent.size, CGSize(width: 64, height: 64))
        } catch QRCodeGeneratorError.dataTooBig {
            XCTFail("Data too big.")
        } catch {
            XCTFail("Failed to generate image.")
        }
    }


    static var allTests : [(String, (QRSwiftTests) -> () throws -> Void)] {
        return [
            ("testQRCodeSize", testQRCodeSize)
        ]
    }
}
