//
//  SuppressionClientUITests.swift
//  RelayanceUITests
//
//  Created by Julien Choromanski on 27/07/2025.
//

import XCTest

final class SuppressionClientUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    // Test Scénario : Supprimer un client existant
    func test_supprimerClient_GivenExistingClient_WhenDeletingClient_ThenClientIsRemoved() throws {
        // Given L'utilisateur est sur la liste des clients
        app.activate()

        // And La liste contient le client "Frida Kahlo"
        XCTAssertTrue(app.staticTexts["Frida Kahlo"].exists)

        // When L'utilisateur sélectionne le client "Frida Kahlo"
        app.staticTexts["Frida Kahlo"].tap()
        
        // And L'utilisateur appuie sur le bouton "Supprimer"
        app.buttons["Supprimer"].tap()
        
        // Then L'application revient sur l'écran de la liste des clients
        XCTAssertTrue(app.navigationBars["Liste des clients"].exists)
        
        // And Le client "Frida Kahlo" n'apparaît plus dans la liste
        XCTAssertFalse(app.staticTexts["Frida Kahlo"].exists, "Frida Kahlo ne devrait plus être dans la liste")
    }
    
}
