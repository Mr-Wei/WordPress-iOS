import Foundation
import WordPressShared

/// This class groups all of the styles used by all of the ActivityListViewController.
///
extension WPStyleGuide {
    public struct Activity {

        // MARK: - Public Properties

        public static func gravatarPlaceholderImage() -> UIImage {
            return gravatar
        }

        public static func summaryRegularStyle() -> [String: AnyObject] {
            return  [NSParagraphStyleAttributeName: summaryParagraph,
                     NSFontAttributeName: summaryRegularFont,
                     NSForegroundColorAttributeName: WPStyleGuide.littleEddieGrey()]
        }

        public static func summaryBoldStyle() -> [String: AnyObject] {
            return [NSParagraphStyleAttributeName: summaryParagraph,
                    NSFontAttributeName: summaryBoldFont,
                    NSForegroundColorAttributeName: WPStyleGuide.littleEddieGrey()]
        }

        public static func timestampStyle() -> [String: AnyObject] {
            return  [NSFontAttributeName: timestampFont,
                     NSForegroundColorAttributeName: WPStyleGuide.allTAllShadeGrey()]
        }

        public static func backgroundColor() -> UIColor {
            return UIColor.white
        }

        public static func backgroundRewindableColor() -> UIColor {
            return WPStyleGuide.lightBlue()
        }

        // MARK: - Private Properties

        fileprivate static let gravatar = UIImage(named: "gravatar")!

        private static var timestampFont: UIFont {
            return WPStyleGuide.fontForTextStyle(.caption1)
        }

        private static var summaryRegularFont: UIFont {
            return WPStyleGuide.fontForTextStyle(.footnote)
        }

        private static var summaryBoldFont: UIFont {
            return WPStyleGuide.fontForTextStyle(.footnote, fontWeight: UIFontWeightSemibold)
        }

        private static var summaryLineSize: CGFloat {
            return WPStyleGuide.fontSizeForTextStyle(.footnote) * 1.3
        }

        private static var summaryParagraph: NSMutableParagraphStyle {
            return NSMutableParagraphStyle(minLineHeight: summaryLineSize,
                                           maxLineHeight: summaryLineSize,
                                           lineBreakMode: .byTruncatingTail,
                                           alignment: .natural)
        }
    }
}
