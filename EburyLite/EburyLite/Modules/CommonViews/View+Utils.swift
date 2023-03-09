//
//  View+Utils.swift
//  EburyLite
//
//  Created by Demian Tejo on 07/03/2023.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
