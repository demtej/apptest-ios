//
//  UserScreen.swift
//  EburyLite
//
//  Created by Demian Tejo on 08/03/2023.
//

import SwiftUI

struct UserScreen: View, ViewControllableProtocol {
    
    var viewModel: UserViewModel

    var body: some View {
        NavigationView{
            List{
                Section(header: Text("User Information")) {
                    Text("Noel Gallager")
                    Text("Guitarrist")
                    Text("No Bank")
                    Text("XXXXX")
                }
                Section(header: Text("App Details")) {
                    Text("Design by Ebury")
                    Text("Developed by @demitej")
                }
            }.navigationTitle("User")
        }
    }

}

