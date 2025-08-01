//
//  ListClientsView.swift
//  Relayance
//
//  Created by Amandine Cousin on 10/07/2024.
//

import SwiftUI

struct ListClientsView: View {
    @StateObject var clientViewModel: ClientsViewModel
    @State private var showModal: Bool = false
    
    var body: some View {
        NavigationStack {
            List(clientViewModel.clientsList, id: \.self) { client in
                NavigationLink {
                    DetailClientView(clientViewModel: clientViewModel,
                                     client: client)
                } label: {
                    Text(client.nom)
                        .font(.title3)
                }
            }
            .navigationTitle("Liste des clients")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Ajouter un client") {
                        showModal.toggle()
                    }
                    .foregroundStyle(.orange)
                    .bold()
                }
            }
            .sheet(isPresented: $showModal, content: {
                AjoutClientView(clientViewModel: clientViewModel, dismissModal: $showModal)
            })
        }
    }

}

#Preview {
    ListClientsView(clientViewModel: ClientsViewModel())
}
