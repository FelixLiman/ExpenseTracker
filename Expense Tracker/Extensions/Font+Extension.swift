//
//  Font+Extension.swift
//  Expense Tracker
//
//  Created by Felix Liman on 28/04/21.
//

import SwiftUI
//
//extension Font {
//
//    /// Create a font with the body text style.
//    static var body: Font {
//        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .body).pointSize)
//    }
//
//    /// Create a font with the callout text style.
//    public static var callout: Font {
//        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .callout).pointSize)
//    }
//
//    /// Create a font with the caption text style.
//    public static var caption1: Font {
//        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .caption1).pointSize)
//    }
//
//    /// Create a font with the caption text style.
//    public static var caption2: Font {
//        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .caption2).pointSize)
//    }
//
//    /// Create a font with the footnote text style.
//    public static var footnote: Font {
//        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .footnote).pointSize)
//    }
//
//    /// Create a font with the headline text style.
//    public static var headline: Font {
//        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .headline).pointSize)
//    }
//
//    /// Create a font with the large title text style.
//    public static var largeTitle: Font {
//        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
//    }
//
//    /// Create a font with the subheadline text style.
//    public static var subheadline: Font {
//        return Font.custom("HKGrotesk-Light", size: UIFont.preferredFont(forTextStyle: .subheadline).pointSize)
//    }
//
//    /// Create a font with the title text style.
//    public static var title: Font {
//        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .title1).pointSize)
//    }
//
//    /// Create a font with the title text style.
//    public static var title2: Font {
//        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .title2).pointSize)
//    }
//
//    /// Create a font with the title text style.
//    public static var title3: Font {
//        return Font.custom("HKGrotesk-Regular", size: UIFont.preferredFont(forTextStyle: .title3).pointSize)
//    }
//
//    public static func system(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> Font {
//        var font = "HKGrotesk-Regular"
//        switch weight {
//        case .bold: font = "HKGrotesk-Bold"
//        case .heavy: font = "HKGrotesk-ExtraBold"
//        case .light: font = "HKGrotesk-Light"
//        case .medium: font = "HKGrotesk-Regular"
//        case .semibold: font = "HKGrotesk-SemiBold"
//        case .thin: font = "HKGrotesk-Light"
//        case .ultraLight: font = "HKGrotesk-Light"
//        default: break
//        }
//        return Font.custom(font, size: size)
//    }
//}

struct MyFont: ViewModifier {
    
    @Environment(\.sizeCategory) var sizeCategory
    
    public enum TextStyle {
        case largeTitle
        case title1
        case title2
        case title3
        case headline
        case subheadline
        case body
        case callout
        case caption1
        case caption2
        case footnote
    }
    
    var textStyle: TextStyle

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
       return content.font(.custom(fontName, size: scaledSize))
    }
    
    private var fontName: String {
        switch textStyle {
        case .largeTitle:
            return "HKGrotesk-Regular"
        case .title1:
            return "HKGrotesk-Regular"
        case .title2:
            return "HKGrotesk-Regular"
        case .title3:
            return "HKGrotesk-Regular"
        case .headline:
            return "HKGrotesk-Regular"
        case .subheadline:
            return "HKGrotesk-Light"
        case .body:
            return "HKGrotesk-Regular"
        case .callout:
            return "HKGrotesk-Regular"
        case .caption1:
            return "HKGrotesk-Regular"
        case .caption2:
            return "HKGrotesk-Regular"
        case .footnote:
            return "HKGrotesk-Regular"
        }
    }
    
    private var size: CGFloat {
        switch textStyle {
        case .largeTitle:
            return UIFont.preferredFont(forTextStyle: .largeTitle).pointSize
        case .title1:
            return UIFont.preferredFont(forTextStyle: .title1).pointSize
        case .title2:
            return UIFont.preferredFont(forTextStyle: .title2).pointSize
        case .title3:
            return UIFont.preferredFont(forTextStyle: .title3).pointSize
        case .headline:
            return UIFont.preferredFont(forTextStyle: .headline).pointSize
        case .subheadline:
            return UIFont.preferredFont(forTextStyle: .subheadline).pointSize
        case .body:
            return UIFont.preferredFont(forTextStyle: .body).pointSize
        case .callout:
            return UIFont.preferredFont(forTextStyle: .callout).pointSize
        case .caption1:
            return UIFont.preferredFont(forTextStyle: .caption1).pointSize
        case .caption2:
            return UIFont.preferredFont(forTextStyle: .caption2).pointSize
        case .footnote:
            return UIFont.preferredFont(forTextStyle: .footnote).pointSize
        }
    }
    
}

extension View {
    
    func myFont(_ textStyle: MyFont.TextStyle) -> some View {
        self.modifier(MyFont(textStyle: textStyle))
    }
}
