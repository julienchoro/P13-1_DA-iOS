//
//  RelayanceApp.swift
//  Relayance
//
//  Created by Amandine Cousin on 08/07/2024.
//

import SwiftUI

@main
struct RelayanceApp: App {
    @StateObject private var viewModel = ClientsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ListClientsView(clientViewModel: viewModel)
        }
    }
}
