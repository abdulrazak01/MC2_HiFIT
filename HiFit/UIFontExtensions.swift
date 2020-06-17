//
//  UIFontExtensions.swift
//  HiFit
//
//  Created by Omar Tan Johan Tan on 17/06/20.
//  Copyright © 2020 AbdulRazak. All rights reserved.
//
import UIKit

extension UIFont {
    static var largeTitle: UIFont {
        return UIFont.preferredFont(forTextStyle: .largeTitle)
    }
    static var title1: UIFont {
        return UIFont.preferredFont(forTextStyle: .title1)
    }
    static var title2: UIFont {
        return UIFont.preferredFont(forTextStyle: .title2)
    }
    static var title3: UIFont {
        return UIFont.preferredFont(forTextStyle: .title3)
    }
    static var headline: UIFont {
        return UIFont.preferredFont(forTextStyle: .headline)
    }
    static var body: UIFont {
        return UIFont.preferredFont(forTextStyle: .body)
    }
    static var callout: UIFont {
        return UIFont.preferredFont(forTextStyle: .callout)
    }
    static var subhead: UIFont {
        return UIFont.preferredFont(forTextStyle: .subheadline)
    }
    static var footnote: UIFont {
        return UIFont.preferredFont(forTextStyle: .footnote)
    }
    static var caption1: UIFont {
        return UIFont.preferredFont(forTextStyle: .caption1)
    }
    static var caption2: UIFont {
        return UIFont.preferredFont(forTextStyle: .caption2)
    }
    func with(weight: UIFont.Weight) -> UIFont {
        return UIFont.systemFont(ofSize: pointSize, weight: weight)
    }
}
