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
        let nom = "Ju Cho"
        let email = "julienchoro@icloud.com"
        
        let success = clientsViewModel.ajouterNouveauClient(nom: nom, email: email)
        
        XCTAssertTrue(success)
    }
    
    func test_ajouterClient_GivenInvalidEmailAndName_WhenAddingClient_ThenClientIsNotAdded() {
        let clientsViewModel = ClientsViewModel()
        let nom = "Ju Cho"
        let email = "JuCho.invalide"
        
        let success = clientsViewModel.ajouterNouveauClient(nom: nom, email: email)

        XCTAssertFalse(success)
    }

}
