//
//  UIButtonExtensions.swift
//  HiFit
//
//  Created by Omar Tan Johan Tan on 17/06/20.
//  Copyright © 2020 AbdulRazak. All rights reserved.
//
import UIKit

extension UIButton
{
    /**
     # Apply Gradient
     UIButton Extension to make applying gradient a breeze
     
     Check out [AppCoda](https://www.appcoda.com/cagradientlayer/) for gradient direction info
     
     - Parameters:
     - colors: Minimum 2 colors
     - radius: Optional
     - startGradient: Optional, range: 0.0 - 1.0
     - endGradient: Optional, range: 0.0 - 1.0
     */
    func applyGradient(colors: [CGColor], radius:CGFloat = 0, startGradient:CGPoint = CGPoint(x: 0.5, y: 0.0), endGradient:CGPoint = CGPoint(x: 0.5, y: 1.0))
    {
        // check first if there is already a gradient layer to avoid adding more than one
        if let firstIndex = layer.sublayers?.firstIndex(where: {$0.name == "gradient"}),
            let gradientLayer = layer.sublayers?[firstIndex] as? CAGradientLayer {
            gradientLayer.cornerRadius = radius
            gradientLayer.colors = colors
            gradientLayer.startPoint = startGradient
            gradientLayer.endPoint = endGradient
            gradientLayer.frame = bounds
            // if not found create a new gradient layer
        } else {
            let gradientLayer = CAGradientLayer()
            gradientLayer.name = "gradient"
            gradientLayer.cornerRadius = radius
            gradientLayer.colors = colors
            gradientLayer.startPoint = startGradient
            gradientLayer.endPoint = endGradient
            gradientLayer.frame = bounds
            layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}

