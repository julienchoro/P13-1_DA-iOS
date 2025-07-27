//
//  ModelDataTests.swift
//  RelayanceTests
//
//  Created by Julien Choromanski on 27/07/2025.
//

import XCTest
@testable import Relayance

final class ModelDataTests: XCTestCase {

    // Test of the chargement method
    func test_chargement_GivenValidJSONFile_WhenLoading_ThenReturnsDecodedData() {
        // Given
        let fileName = "Source.json"
        
        // When
        let clients : [Client] = ModelData.chargement(fileName)
        
        // Then
        XCTAssertEqual(clients.count, 8)
        XCTAssertEqual(clients[0].nom, "Frida Kahlo")
        XCTAssertEqual(clients[0].email, "frida.kahlo@example.com")
        XCTAssertEqual(clients[0].formatDateVersString(), "15-01-2024")
    }
    
}


