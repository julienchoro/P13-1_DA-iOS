//
//  ClientsViewModelTests.swift
//  RelayanceTests
//
//  Created by Julien Choromanski on 27/07/2025.
//

import XCTest
@testable import Relayance

final class ClientsViewModelTests: XCTestCase {
    
    // Test for the Add client feature
    func test_ajouterClient_GivenValidEmailAndName_WhenAddingClient_ThenClientIsAdded() {
        // Given
        let clientsViewModel = ClientsViewModel()
        let nom = "Ju Cho"
        let email = "julienchoro@icloud.com"
        
        // When
        let success = clientsViewModel.ajouterNouveauClient(nom: nom, email: email)
        
        // Then
        XCTAssertTrue(success)
    }
    
    func test_ajouterClient_GivenInvalidEmailAndName_WhenAddingClient_ThenClientIsNotAdded() {
        // Given
        let clientsViewModel = ClientsViewModel()
        let nom = "Ju Cho"
        let email = "JuCho.invalide"
        
        // When
        let success = clientsViewModel.ajouterNouveauClient(nom: nom, email: email)
        
        // Then
        XCTAssertFalse(success)
    }
    
    // Test for the delete client feature
    func test_supprimerClient_GivenExistingClient_WhenDeletingClient_ThenClientIsRemoved() {
        // Given
        let viewModel = ClientsViewModel()
        let fridaClient = viewModel.clientsList.first(where: { $0.nom == "Frida Kahlo" })
        XCTAssertEqual(fridaClient?.nom, "Frida Kahlo" )
        
        // When
        let success = viewModel.supprimerClient(client: fridaClient!)
        
        // Then
        XCTAssertTrue(success)
        XCTAssertFalse(viewModel.clientsList.contains(where: { $0.nom == "Frida Kahlo" }))
    }
    
    func test_supprimerClient_GivenNonExistingClient_WhenDeletingClient_ThenReturnsFalse() {
        // Given
        let viewModel = ClientsViewModel()
        let nom = "client inexistant"
        let email = "client@inexistant.com"
        
        // When
        let success = viewModel.supprimerClient(client: Client.creerNouveauClient(nom: nom,
                                                                          email: email))
        
        // Then
        XCTAssertFalse(success)
    }
    
}
