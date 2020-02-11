//
//  CVCCoordinator.swift
//  CoordinatorSample
//
//  Created by Aldo Bergamini on 27/01/2020.
//  Copyright © 2020 iBat Inc. All rights reserved.
//

import UIKit



class SampleCoordinator: Coordinator {
    
    // MARK: Properties
    
    var viewTarget: ViewTarget
    
    
    // MARK: - Coordinator Interface
    
    func start() {
        
        self.resetDisplay()
    }
    
    // MARK: - Life Cycle
    
    init(viewController: ViewTarget) {
        
        self.viewTarget = viewController
    }
    
    // MARK: - Helpers
    
    func resetDisplay() {
        
        if let viewController = self.viewTarget as? SampleDisplayView {
            
            viewController.clearDisplay()
        }
    }
    
    func doCalculation(_ input: String?) {
        
        if let input = input {
            
            if let integerInput = NSInteger(input) {
                
                let isTrue = randomBool(integerInput)
                
                if let view = self.viewTarget as? SampleDisplayView {
                    
                    view.displayCalculationResult(isTrue, error: nil)
                }
            }
        }
    }
    
    func doCalculationWithResult(_ input: String?) -> String {
        
        let resultString = "XXXXX"

        if let _ = input {
            
            if let view = self.viewTarget as? SampleDisplayView {
                
                view.displayStringResult(resultString, error: nil)
            }
        }
        
        return resultString
    }
    
    private func randomBool(_ input: NSInteger) -> Bool {
        return arc4random_uniform(2) == 0
    }
}
