//
//  TutorialModel.swift
//  MyTurn
//
//  Created by Simmonds, Eli on 2/28/20.
//  Copyright © 2020 Eli Simmonds. All rights reserved.
//

import Foundation
import UIKit

/// A data representation of a Tutorial screen.
open class TutorialModel {
    var title = ""
    var description = ""
    var image: UIImage?
    
    /**
      Initializes a Tutorial Model object
      - Parameter title: The title of the tutorial page. Displayed directly below the image
      - Parameter description: The text for the description of the tutorial page. Displayed directly below the title
      - Parameter image: The image to display on the tutorial page.
     */
    public init(title: String, description: String, image: UIImage?) {
        self.title = title
        self.description = description
        self.image = image
    }
}
