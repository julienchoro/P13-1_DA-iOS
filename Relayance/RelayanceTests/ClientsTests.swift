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
    
    // Test for the method creerNouveauClient(nom: String, email: String)
    func test_creerNouveauClient_GivenNameAndEmail_WhenCreatingNewClient_ThenClientIsCreatedWithCurrentDate() {
        // Given
        let nom = "Ju"
        let email = "julienchoro@icloud.com"
        
        // When
        let client = Client.creerNouveauClient(nom: nom,
                                  email: email)
        
        // Then
        XCTAssertEqual(client.nom, nom)
        XCTAssertEqual(client.email, email)
        XCTAssertNotNil(client.dateCreation)
        XCTAssertEqual(client.dateCreation.getDay(), Date().getDay())
        XCTAssertEqual(client.dateCreation.getMonth(), Date().getMonth())
        XCTAssertEqual(client.dateCreation.getYear(), Date().getYear())
        
    }
    
    // Test for the method estNouveauClient()
    func test_estNouveauClient_GivenClientCreatedToday_WhenCheckingIfNew_ThenTrue() {
        //Given
        let client = Client.creerNouveauClient(nom: "Ju",
                                               email: "julienchoro@icloud.com")
        
        // When
        let estNouveauClient = client.estNouveauClient()
        
        // Then
        XCTAssertTrue(estNouveauClient)
    }
    
    func test_estNouveauClient_GivenClientCreatedYesterday_WhenCheckingIfNew_ThenFalse() {
        // Given
        let client = Client(nom: "Ju",
                            email: "julienchoro@icloud.com",
                            dateCreationString: "2025-07-23T08:30:00Z")
        
        // When
        let estNouveauClient = client.estNouveauClient()
        
        // Then
        XCTAssertFalse(estNouveauClient)
    }
    
    // Test for the method clientExiste(clientsList: [Client])
    func test_clientExiste_GivenClientListContainingClient_WhenCheckingIfExist_ThenTrue() {
        // Given
        let client1 = Client.creerNouveauClient(nom: "client1",
                                                email: "test1@test.com")
        let client2 = Client.creerNouveauClient(nom: "client2",
                                                email: "test2@test.com")
        let client3 = Client.creerNouveauClient(nom: "client3",
                                                email: "test3@test.com")
        
        // When
        let clientlist1 = [client1, client2, client3]
        let clientlist2 = [client1, client2]
        let clientlist3 : [Client] = []
        
        // Then
        XCTAssertTrue(client3.clientExiste(clientsList: clientlist1))
        XCTAssertFalse(client3.clientExiste(clientsList: clientlist2))
        XCTAssertFalse(client1.clientExiste(clientsList: clientlist3))

    }
    
    // Test for the method formatDateVersString()
    func test_formatDateVersString_GivenValidDate_WhenFormatting_ThenReturnsFormattedString() {
        // Given
        let client = Client(nom: "Ju",
                            email: "julienchoro@icloud.com",
                            dateCreationString: "2025-07-27T08:30:00Z")
        
        // When
        let formattedDate = client.formatDateVersString()
        
        // Then
        XCTAssertEqual(formattedDate, "27-07-2025")
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
