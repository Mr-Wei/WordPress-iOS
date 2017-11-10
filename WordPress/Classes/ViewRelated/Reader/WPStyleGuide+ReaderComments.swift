import Foundation
import WordPressShared

extension WPStyleGuide {

    public class func defaultSearchBarTextAttributes(_ color: UIColor) -> [String: AnyObject] {
        return [
            NSAttributedStringKey.foregroundColor.rawValue: color,
            NSAttributedStringKey.font.rawValue: WPStyleGuide.fontForTextStyle(.footnote)
        ]
    }
}
