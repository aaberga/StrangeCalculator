//
//  KeyboardScrollerView.swift
//  StrangeCalculatorTests
//
//  Created by Aldo Bergamini on 30/11/2019.
//  Copyright © 2019 Frequency Communications. All rights reserved.
//

import UIKit

class KeyboardScrollerViewController: UIViewController {

    // MARK: Life Cycle
    
    override func viewDidLoad() {

        super.viewDidLoad()

        // Keyboard Scrolling

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    
        
    // MARK: Private Properties
    
    private var parentView: UIView = UIView()
    private var contentView: UIView = UIView()
    private var scrollView: UIScrollView = UIScrollView()
    
    // MARK: Keyboard Scrolling Helper
    
    @objc func embedInScroller(_ embeddedView: UIView, from parentView: UIView) {
        
        self.contentView = embeddedView
        self.parentView = parentView
        
        self.view.backgroundColor = UIColor.gray
        
  /*
         //FROM: -> https://medium.com/@evanhughes3/creating-a-uiscrollview-without-using-interface-builder-434dfac1a320
         self.view.backgroundColor = UIColor.gray
         
         //Add and setup scroll view
         self.view.addSubview(self.scrollView)
         self.scrollView.translatesAutoresizingMaskIntoConstraints = false;

         //Constrain scroll view
         self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true;
         self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true;
         self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true;
         self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true;

*/
        var containerView = UIView()
        
        containerView = parentView
     }
    
 @objc func adjustForKeyboard(notification: Notification) {
    
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }

//        scrollView.scrollIndicatorInsets = contentView.contentInset

//        let selectedRange = contentView.selectedRange
//        contentView.scrollRangeToVisible(selectedRange)
    }
}
