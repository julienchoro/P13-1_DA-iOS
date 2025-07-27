//
//  ClientsViewModel.swift
//  Relayance
//
//  Created by Julien Choromanski on 27/07/2025.
//

import Foundation

class ClientsViewModel: ObservableObject {
    @Published var clientsList: [Client]
    
    init() {
        clientsList = ModelData.chargement("Source.json")
    }
    
    func ajouterNouveauClient(nom: String, email: String) -> Bool {
        if !validerEmail(email: email) {
            return false
        } else {
            clientsList.append(Client.creerNouveauClient(nom: nom, email: email))
            return true
        }
    }
    
    private func validerEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
}
