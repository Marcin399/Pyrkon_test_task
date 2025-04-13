import XCTest
@testable import Pyrkon_test_app

final class GuestAdapterTests: XCTestCase {
    var sut: GuestAdapter!
    
    override func setUp() {
        super.setUp()
        sut = GuestAdapter()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testAdaptSuccess() {
        // Given
        let dto = GuestDTO(
            name: "Test Guest",
            summary: "Test Summary",
            imageURL: "https://example.com/image.jpg",
            zones: ["literacka", "komiksowa"]
        )
        
        // When
        let guest = sut.adapt(dto: dto)
        
        // Then
        XCTAssertEqual(guest.name, "Test Guest")
        XCTAssertEqual(guest.summary, "Test Summary")
        XCTAssertEqual(guest.imageURL.absoluteString, "https://example.com/image.jpg")
        XCTAssertEqual(guest.zones.count, 2)

    }
    
    
    func testAdaptWithInvalidZones() {
        // Given
        let dto = GuestDTO(
            name: "Test Guest",
            summary: "Test Summary",
            imageURL: "https://example.com/image.jpg",
            zones: ["invalid_zone"]
        )
        
        // When
        let guest = sut.adapt(dto: dto)
        
        // Then
        XCTAssertEqual(guest.name, "Test Guest")
        XCTAssertEqual(guest.summary, "Test Summary")
        XCTAssertEqual(guest.imageURL.absoluteString, "https://example.com/image.jpg")
        XCTAssertTrue(guest.zones.isEmpty)
    }
} 
