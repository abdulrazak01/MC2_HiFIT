//
//  UILabelExtensions.swift
//  HiFit
//
//  Created by Omar Tan Johan Tan on 17/06/20.
//  Copyright © 2020 AbdulRazak. All rights reserved.
//
import UIKit

// Dependencies: UIFontExtensions.swift
extension UILabel {
    func dynamicFont(textStyles: UIFont, weight: UIFont.Weight, dynamicType: Bool ) {
        let style = textStyles.with(weight: weight)
        self.font = UIFontMetrics.default.scaledFont(for: style)
        self.adjustsFontForContentSizeCategory = dynamicType
    }
}
