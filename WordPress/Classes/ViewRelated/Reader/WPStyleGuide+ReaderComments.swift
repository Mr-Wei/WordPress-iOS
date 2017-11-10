import Foundation
import WordPressShared

extension WPStyleGuide {

    public class func defaultSearchBarTextAttributes(_ color: UIColor) -> [NSAttributedStringKey: AnyObject] {
        return [
            .foregroundColor: color,
            .font: WPStyleGuide.fontForTextStyle(.footnote)
        ]
    }
}
