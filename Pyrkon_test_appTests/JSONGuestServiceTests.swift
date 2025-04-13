import XCTest
@testable import Pyrkon_test_app

final class JSONGuestServiceTests: XCTestCase {
    var sut: JSONGuestService!
    
    override func setUp() {
        super.setUp()
        sut = JSONGuestService()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFetchGuestsSuccess() async {
        // When
        let guests = await sut.fetchGuests()
        
        // Then
        XCTAssertFalse(guests.isEmpty, "Guests array should not be empty")
        XCTAssertTrue(guests.allSatisfy { !$0.name.isEmpty }, "All guests should have names")
        XCTAssertTrue(guests.allSatisfy { !$0.summary.isEmpty }, "All guests should have summaries")
        XCTAssertTrue(guests.allSatisfy { $0.imageURL.hasPrefix("http") }, "All guests should have valid image URLs")
    }
    
    func testGuestDTOStructure() async {
        // When
        let guests = await sut.fetchGuests()
        
        // Then
        for guest in guests {
            XCTAssertFalse(guest.name.isEmpty, "Guest name should not be empty")
            XCTAssertFalse(guest.summary.isEmpty, "Guest summary should not be empty")
            XCTAssertTrue(guest.imageURL.hasPrefix("http"), "Guest image URL should be valid")
        }
    }
} 
