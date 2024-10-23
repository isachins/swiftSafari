//
//  ReusableStyles.swift
//  SwiftUIPlayground
//
//  Created by Sachin Sharma on 29/08/24.
//

import Foundation
import SwiftUI

public enum Spacing {
  public static let small: CGFloat = 8
  public static let medium: CGFloat = 16
  public static let large: CGFloat = 32
  public static let extrLarge: CGFloat = 64
}

public struct PrimaryButtonStyle: ButtonStyle {
  public init() {}
  
  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
          .font(.headline)
          .fontWeight(.semibold)
          .foregroundStyle(.white)
          .background(.accent)
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .minimumScaleFactor(0.8)
          .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
          .onChange(of: configuration.isPressed) {
              let generator = UIImpactFeedbackGenerator(style: .medium)
              generator.impactOccurred()
          }
  }
}
