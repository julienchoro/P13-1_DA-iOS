//
//  AjoutClientUITests.swift
//  RelayanceUITests
//
//  Created by Julien Choromanski on 27/07/2025.
//

import XCTest
import SwiftUI

final class AjoutClientUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    // Test Scénario : Add client with valid information
    func test_ajoutClient_GivenValidEmailAndName_WhenAddingClient_ThenClientIsAdded() throws {
        // Given L'utilisateur est sur la liste des clients
        app.activate()
        
        // When L'utilisateur appuie sur le bouton "Ajouter un client"
        app.buttons["Ajouter un client"].tap()
        
        // And L'utilisateur saisit "Ju Cho" dans le champ nom
        app.textFields["Nom"].tap()
        app.typeText("Ju Cho")
        
        // And L'utilisateur saisit "julienchoro@icloud.com" dans le champ email
        app.textFields["Email"].tap()
        app.typeText("julienchoro@icloud.com")
        
        // And L'utilisateur appuie sur le bouton "Ajouter"
        app.buttons["Ajouter"].tap()
        
        // Then L'application revient sur l'écran de la liste des clients
        XCTAssertTrue(app.navigationBars["Liste des clients"].exists)

        // And Le client "Ju Cho" apparaît dans la liste des clients
        XCTAssertTrue(app.staticTexts["Ju Cho"].exists)
        
    }
    
    // Test Scénario : Add client with invalid information
    func test_ajoutClient_GivenInvalidEmailAndName_WhenAddingClient_ThenClientIsNotAdded() throws {
        // Given L'utilisateur est sur la liste des clients
        app.activate()
        
        // When L'utilisateur appuie sur le bouton "Ajouter un client"
        app.buttons["Ajouter un client"].tap()
        
        // And L'utilisateur saisit "Ju Cho" dans le champ nom
        app.textFields["Nom"].tap()
        app.typeText("Ju Cho")
        
        // And L'utilisateur saisit "julienchoro.com" dans le champ email
        app.textFields["Email"].tap()
        app.typeText("julienchoro.com")
        
        // And L'utilisateur appuie sur le bouton "Ajouter"
        app.buttons["Ajouter"].tap()
        
        // Then L'application revient sur l'écran de la liste des clients
        XCTAssertTrue(app.navigationBars["Liste des clients"].exists)

        // And Le client "Ju Cho" n'apparaît pas dans la liste des clients
        XCTAssertFalse(app.staticTexts["Ju Cho"].exists)
        
    }
}
