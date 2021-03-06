//
//  TutorialViewController.swift
//  MyTurn
//
//  Created by Simmonds, Eli on 2/28/20.
//  Copyright © 2020 Eli Simmonds. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

/// A UIViewController that is presented to show a horizationtal ScrollView tutorial of how the use the application.
open class TutorialViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let pageControl = UIPageControl(frame:.zero)
    
    private var tutorialModels: [TutorialModel]?
    private var tutorialViews: [TutorialView]?
    private var tutorialAppearance: TutorialAppearance?
    private var completion: (()->())?

    /**
     Initializer for the TutorialViewController
     - Parameter tutorialPages: Data representation of the information displayed on each tutorial page, in order.
     - Parameter tutorialAppearance: Configures the appearance of all subviews.
     - Parameter completion: A completion handler that is fired when the View Controller disappears.
     */
    public convenience init(tutorialPages: [TutorialModel], tutorialAppearance: TutorialAppearance, completion: (() -> ())?) {
        self.init(tutorialPages: tutorialPages)
        
        self.tutorialAppearance = tutorialAppearance
        self.completion = completion
    }
    
    private convenience init(tutorialPages: [TutorialModel]) {
        self.init()
        
        self.title = "Tutorial"
        self.navigationController?.navigationBar.isHidden = false
        self.edgesForExtendedLayout = [] // keeps views from being added below the navigation bar
        self.tutorialModels = tutorialPages
        self.completion = nil
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.backgroundColor = tutorialAppearance?.backgroundColor
        self.view.backgroundColor = tutorialAppearance?.backgroundColor
        self.scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(self.tutorialModels?.count ?? 1), height: self.preferredContentSize.height)
        self.scrollView.isPagingEnabled = true
        self.scrollView.isScrollEnabled = true
        self.scrollView.bounces = true
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.delegate = self
        
        self.view.addSubview(self.scrollView)
        
        self.scrollView.snp.makeConstraints{(make) -> Void in
            make.top.left.right.equalTo(self.view)
            make.bottom.equalToSuperview().inset(self.view.safeAreaInsets.bottom + 50)
        }
        self.createPages()
        
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.pageControl.numberOfPages = self.tutorialViews?.count ?? 1
        self.pageControl.currentPage = 0
        self.view.bringSubviewToFront(pageControl)
        self.view.addSubview(pageControl)
        self.pageControl.snp.makeConstraints{(make) -> Void in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(self.view.safeAreaInsets.bottom + 10)
        }
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Call completion handler on dismissal
        if let completion = self.completion {
            completion()
        }
    }
    
    private func createPages() -> Void {
        guard let tutorialModels = self.tutorialModels else { return }
        guard let appearance = self.tutorialAppearance else { return }
        tutorialViews = Array<TutorialView>()
        var idx = 0
        for tutorial in tutorialModels {
            let tutorialView = TutorialView(tutorial: tutorial, appearance: appearance)
            self.tutorialViews?.append(tutorialView)
            tutorialView.frame = CGRect(x: view.frame.width * CGFloat(idx), y: 0, width: view.frame.width, height: view.frame.height - 100)
            self.scrollView.addSubview(tutorialView)
            
            idx += 1
        }
    }
}

extension TutorialViewController: UIScrollViewDelegate {
    /*
     * default function called when view is scolled.
     */
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        self.pageControl.currentPage = Int(pageIndex)
    }
}
