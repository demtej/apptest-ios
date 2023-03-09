//
//  ProductScreen.swift
//  EburyLite
//
//  Created by Demian Tejo on 06/03/2023.
//

import SwiftUI

struct ProductScreen: View, ViewControllableProtocol {

    var viewModel: ProductViewModel
    typealias Texts = ProductViewModel.Texts
    typealias ImageNames = ProductViewModel.ImageNames

    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text(Texts.title)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, .MEDIUM)
                    .padding(.vertical, .XLARGE)
                    .padding(.top, .XXLARGE)
                Spacer()
                productsView
            }
        }
    }

    var productsView : some View {
        VStack(spacing: .XSMALL) {
            Image(ImageNames.commingSoon)
                .padding(.MEDIUM)
            Text(Texts.commingSoon)
                .frame(maxWidth: .infinity)
                .font(.title2)
            Text(Texts.description)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .font(.headline)
                .fontWeight(.ultraLight)
        }
        .frame(minHeight: viewModel.containerHeight)
        .padding(.MEDIUM)
        .background(
            Rectangle()
                .fill(Color.backgroundColor)
                .cornerRadius(.CONTAINER_RADIUS, corners: [.topLeft, .topRight])
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
        )
    }
}
