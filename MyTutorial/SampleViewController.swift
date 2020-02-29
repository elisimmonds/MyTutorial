//
//  SampleViewController.swift
//  MyTutorial
//
//  Created by Simmonds, Eli on 2/29/20.
//  Copyright © 2020 Eli Simmonds. All rights reserved.
//

import UIKit
import SnapKit

class SampleViewController: UIViewController {
    
    let infoImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Sample Code"
        self.view.addSubview(infoImageView)
        createInfoView()
    }
    
    /// Create & configure the info icon
    private func createInfoView() -> Void {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(infoButtonAction(tapGestureRecognizer:)))
        self.infoImageView.isUserInteractionEnabled = true
        self.infoImageView.addGestureRecognizer(tapGestureRecognizer)
        // Change the settings image color to match our color assets.
        let infoImage = UIImage.init(systemName: "questionmark")?.withTintColor(UIColor.red, renderingMode: .automatic)
        self.infoImageView.image = infoImage
        
        self.view.addSubview(self.infoImageView)
        self.infoImageView.snp.makeConstraints{(make) -> Void in
            make.height.width.equalTo(40)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    /// Display the Info screen modally
    @objc private func infoButtonAction(tapGestureRecognizer: UITapGestureRecognizer) -> Void {
        let tutorials: [TutorialModel] = [
            TutorialModel(title: "Test1", description: "This is my test. First grab a buddy and try the App!", image: UIImage.init(systemName: "camera")),
            TutorialModel(title: "Test2", description: "This is my test. First grab a buddy and try the App!", image: UIImage.init(systemName: "camera"))
        ]
        let appearance = TutorialAppearance(titleSize: 50, titleFont: "HelveticaNeue-Bold", descriptionSize: 15, descriptionFont: "HelveticaNeue-Bold", backgroundColor: UIColor.systemGray)
        let tutorialViewController = TutorialViewController(tutorialPages: tutorials, tutorialAppearance: appearance)
        let navController = UINavigationController(rootViewController: tutorialViewController)
        self.navigationController?.present(navController, animated: true, completion: nil)
    }


}

