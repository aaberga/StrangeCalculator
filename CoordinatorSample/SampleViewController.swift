//
//  SampleViewController.swift
//  SampleViewController
//
//  Created by Aldo Bergamini on 27/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import UIKit


protocol SampleDisplayView: TargetView {
    
    func clearDisplay ()
    func displayCalculationResult(_ result: Bool, error: Error?)

}


class SampleViewController: UIViewController, SampleDisplayView {
 
    // VC Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        coordinator = SampleCoordinator(viewController: self)
        coordinator?.start()
    }

    // Private Properties
    
    private var coordinator: Coordinator?
    
    
    // Outlets
    
    
    
    // Actions
    
    
    
    // Sample View Interface
    
    func clearDisplay () {
        
        
    }
    
    func displayCalculationResult(_ result: Bool, error: Error?) {

    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
