//
//  ClientsViewModelTests.swift
//  RelayanceTests
//
//  Created by Julien Choromanski on 27/07/2025.
//

import XCTest
@testable import Relayance

final class ClientsViewModelTests: XCTestCase {

    // Green
    func test_ajouterClient_GivenValidEmailAndName_WhenAddingClient_ThenClientIsAdded() {
        let clientsViewModel = ClientsViewModel()
        let client = Client.creerNouveauClient(nom: "Ju Cho",
                            email: "julienchoro@icloud.com")
        
        let success = clientsViewModel.ajouterNouveauClient(client: client)
        
        XCTAssertTrue(success)
    }

}
