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
    
}
