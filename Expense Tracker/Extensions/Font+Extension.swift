//
//  Font+Extension.swift
//  Expense Tracker
//
//  Created by Felix Liman on 28/04/21.
//

import SwiftUI

extension Font {
    
    /// Create a font with the body text style.
    public static var body: Font {
        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .body).pointSize)
    }
    
    /// Create a font with the callout text style.
    public static var callout: Font {
        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .callout).pointSize)
    }
    
    /// Create a font with the caption text style.
    public static var caption1: Font {
        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .caption1).pointSize)
    }
    
    /// Create a font with the caption text style.
    public static var caption2: Font {
        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .caption2).pointSize)
    }
    
    /// Create a font with the footnote text style.
    public static var footnote: Font {
        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .footnote).pointSize)
    }
    
    /// Create a font with the headline text style.
    public static var headline: Font {
        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .headline).pointSize)
    }
    
    /// Create a font with the large title text style.
    public static var largeTitle: Font {
        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
    }
    
    /// Create a font with the subheadline text style.
    public static var subheadline: Font {
        return Font.custom("HKGrotesk-Light", size: UIFont.preferredFont(forTextStyle: .subheadline).pointSize)
    }
    
    /// Create a font with the title text style.
    public static var title: Font {
        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .title1).pointSize)
    }
    
    /// Create a font with the title text style.
    public static var title2: Font {
        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .title2).pointSize)
    }
    
    /// Create a font with the title text style.
    public static var title3: Font {
        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .title3).pointSize)
    }
    
    public static func system(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> Font {
        var font = "HKGrotesk-Regular"
        switch weight {
        case .bold: font = "HKGrotesk-Bold"
        case .heavy: font = "HKGrotesk-ExtraBold"
        case .light: font = "HKGrotesk-Light"
        case .medium: font = "HKGrotesk-Regular"
        case .semibold: font = "HKGrotesk-SemiBold"
        case .thin: font = "HKGrotesk-Light"
        case .ultraLight: font = "HKGrotesk-Light"
        default: break
        }
        return Font.custom(font, size: size)
    }
}
