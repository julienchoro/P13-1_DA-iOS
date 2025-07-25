//
//  ClientsTests.swift
//  Relayance
//
//  Created by Julien Choromanski on 24/07/2025.
//

import XCTest
@testable import Relayance

final class ClientsTests: XCTestCase {
    
    // Test for the init method
    func test_GivenValidData_WhenCreatingClient_ThenClientIsCreated() {
        let client = Client(nom: "Choro",
                            email: "julienchoro@icloud.com",
                            dateCreationString: "2025-07-24T08:30:00Z")
        
        // Then
        XCTAssertEqual(client.nom, "Choro")
        XCTAssertEqual(client.email, "julienchoro@icloud.com")
        let expectedDate = Date.dateFromString("2025-07-24T08:30:00Z")
        XCTAssertNotNil(expectedDate)
        XCTAssertEqual(client.dateCreation, expectedDate)
    }
    
    // Test for the date computed property
    func test_GivenInvalidDateFormat_WhenCreatingClient_ThenDateCreationUsesCurrentDate() {
        // Given
        let date = Date.stringFromDate(Date())
        // When
        let client = Client(nom: "Choro",
                            email: "julienchoro@icloud.com",
                            dateCreationString: "invalid")
        // Then
        XCTAssertEqual(client.formatDateVersString(), date)
    }
    
}

//    func Given_When_Then() {
//        // Given
//
//        // When
//
//        // Then
//
//    }
