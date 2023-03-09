//
//  AuthenticationScreen.swift
//  EburyLite
//
//  Created by Demian Tejo on 08/03/2023.
//

import SwiftUI
import LocalAuthentication

struct AuthenticationScreen: View, ViewControllableProtocol {

    @State var isUnlocked = false

    var body: some View {
        VStack {
            if isUnlocked {
                        VStack {
                            Text("Hello User!")
                        }
                    }
                    else {
                        Text("Use your biometrics to use the app.")
                    }
        }.onAppear(perform: authenticate)
    }


    func authenticate() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate yourself to unlock the app."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                success, authenticationError in
               DispatchQueue.main.async {
                   if success {
                        self.isUnlocked = true
                    } else {
                        self.isUnlocked = false
                    }
                }
            }
        }

        else {
            // No Biometrics found
        }
    }
}
