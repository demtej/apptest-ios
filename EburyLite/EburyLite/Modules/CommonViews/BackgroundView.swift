//
//  BackgroundView.swift
//  EburyLite
//
//  Created by Demian Tejo on 06/03/2023.
//

import SwiftUI

struct BackgroundView: View {

    struct ImageNames {
        static let mask = "HomeMask"
        static let cloud = "Cloud"
    }

    var body: some View {
        ZStack {
            LinearGradient(gradient: .appGradient ,startPoint: .bottomTrailing, endPoint: .topLeading)
            .edgesIgnoringSafeArea(.top)
            VStack {
                Spacer()
                Image(ImageNames.mask)
            }
            VStack {
                HStack {
                    Spacer()
                    Image(ImageNames.cloud)
                }.padding(.top, .XXLARGE)
                Spacer()
            }
        }
    }
}

