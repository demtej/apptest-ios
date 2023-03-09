//
//  CellView.swift
//  EburyLite
//
//  Created by Demian Tejo on 07/03/2023.
//

import SwiftUI

/// I created this protocol to separete the business logic from the UI
/// In this way we'll use this cell to represents other business logic like transactions
/// Also, this allows us to create an UI Package totally isolated
protocol CellRepresentable {
    var title: String { get }
    var subtitle: String { get }
    var value: String { get }
    var imageName: String { get }
}


/// A possible improvement: to create a Theme object (protocol) and using dependency injection to not rely on app defined consts
struct CellView: View {

    let dataSource: CellRepresentable
    private let ROW_HEIGHT : CGFloat = 78

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundCellColor)
                .frame(height: ROW_HEIGHT)
                .cornerRadius(.SUBTLE_RADIUS)
                .shadow(color:.blackShadow, radius: .SUBTLE_RADIUS)

            HStack{
                Image(dataSource.imageName)
                    .resizable()
                    .frame(width:.LARGE,height:.LARGE)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: .XXSMALL) {
                    Text(dataSource.title)
                        .fontWeight(.semibold)
                    Text(dataSource.subtitle)
                }
                Spacer()
            }.padding(.SMALL)
            HStack {
                Spacer()
                Text(dataSource.value)
                    .fontWeight(.bold)
            }.padding(.SMALL)
        }
    }
}

