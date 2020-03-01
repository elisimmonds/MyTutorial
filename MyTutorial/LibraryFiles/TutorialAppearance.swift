//
//  TutorialAppearance.swift
//  MyTurn
//
//  Created by Simmonds, Eli on 2/29/20.
//  Copyright © 2020 Eli Simmonds. All rights reserved.
//

import Foundation
import UIKit

/// Configures the appearance of a tutorial walkthrough.
open class TutorialAppearance {
    var titleFontSize: CGFloat!
    var titleFont: String!
    var descriptionFontSize: CGFloat!
    var descriptionFont: String!
    var backgroundColor: UIColor!
    
    /**
     Initializes a Tutorial Model object
     - Parameter titleSize: Size of the title font. Defaults to 30.
     - Parameter titleFont: A string describing the font used for the title. Must be a system font or included in your project already. Defaults to HelveticaNeue-Bold.
     - Parameter descriptionSize: Size of the description font. Defaults to 15.
     - Parameter descriptionFont: A string describing the font used for the description. Must be a system font or included in your project already. Defaults to HelveticaNeue.
     - Parameter backgroundColor: Background color of the UIViewController presented. Defaults to systemGray.
    */
    public convenience init(titleSize: CGFloat?, titleFont: String?, descriptionSize: CGFloat?, descriptionFont: String?, backgroundColor: UIColor?) {
        self.init()
        self.titleFontSize = titleSize ?? 30
        self.titleFont = titleFont ?? "HelveticaNeue-Bold"
        self.descriptionFontSize = descriptionSize ?? 15
        self.descriptionFont = descriptionFont ?? "HelveticaNeue"
        self.backgroundColor = backgroundColor ?? UIColor.systemGray
    }
}
