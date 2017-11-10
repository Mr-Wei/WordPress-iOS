import Foundation
import WordPressShared

extension WPStyleGuide {
    public struct AlertView {
        // MARK: - Title Styles
        public static let titleRegularFont          = WPStyleGuide.fontForTextStyle(.callout,
                                                                                    fontWeight: UIFont.Weight.light.rawValue)
        public static let titleColor                = WPStyleGuide.grey()


        // MARK: - Detail Styles
        public static let detailsRegularFont        = WPStyleGuide.fontForTextStyle(.footnote)
        public static let detailsBoldFont           = WPStyleGuide.fontForTextStyle(.footnote,
                                                                                    fontWeight: UIFont.Weight.semibold.rawValue)
        public static let detailsColor              = WPStyleGuide.darkGrey()

        public static let detailsRegularAttributes  = [
                                                            NSAttributedStringKey.font: detailsRegularFont,
                                                            NSAttributedStringKey.foregroundColor: detailsColor
                                                      ]

        public static let detailsBoldAttributes     = [
                                                            NSAttributedStringKey.font: detailsBoldFont,
                                                            NSAttributedStringKey.foregroundColor: detailsColor
                                                      ]

        // MARK: - Button Styles
        public static let buttonFont                = WPFontManager.systemRegularFont(ofSize: 16)
    }
}
