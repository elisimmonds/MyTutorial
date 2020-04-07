//
//  TutorialView.swift
//  MyTurn
//
//  Created by Simmonds, Eli on 2/28/20.
//  Copyright © 2020 Eli Simmonds. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

/// An individual tutoral view that consists of a title, description and image. 
open class TutorialView: UIView {

    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let imageView = UIImageView()
    var appearance: TutorialAppearance!
    
    let margin: CGFloat = 15
    let imageMargin: CGFloat = 50
    
    private convenience init(title: String, description: String, image: UIImage?, appearance: TutorialAppearance) {
        self.init()
        
        self.appearance = appearance
        
        self.imageView.image = image
        self.titleLabel.text = title
        self.titleLabel.textAlignment = .center
        self.titleLabel.adjustsFontSizeToFitWidth = true
        self.titleLabel.font = UIFont.init(name: appearance.titleFont, size: appearance.titleFontSize)
        self.descriptionLabel.text = description
        self.descriptionLabel.contentMode = .scaleToFill
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.sizeToFit()
        self.descriptionLabel.textAlignment = .center
        self.descriptionLabel.font = UIFont.init(name: appearance.descriptionFont, size: appearance.descriptionFontSize)
        
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        
        self.imageView.snp.makeConstraints{(make) -> Void in
            make.top.equalToSuperview().offset(imageMargin)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom).multipliedBy(0.5)
            make.width.equalTo(self.imageView.snp.height)
        }
        self.titleLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self.imageView.snp.bottom).offset(imageMargin)
            make.left.equalToSuperview().offset(margin)
            make.right.equalToSuperview().inset(margin)
            make.bottom.equalTo(self).multipliedBy(0.75)
        }
        self.descriptionLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self.titleLabel).offset(margin + 25)
            make.left.equalToSuperview().offset(margin)
            make.right.equalToSuperview().inset(margin)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    /**
     Creates a Tutorial View
     - Parameter tutorial: The tutorial model
     - Parameter appearance: Appearance configuration for the walkthrough.
     */
    public convenience init(tutorial: TutorialModel, appearance: TutorialAppearance) {
        self.init(title: tutorial.title, description: tutorial.description, image: tutorial.image, appearance: appearance)
    }
}
