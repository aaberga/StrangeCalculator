//
//  ViewController.swift
//  CoordinatorSample
//
//  Created by Aldo Bergamini on 26/11/2019.
//  Copyright © 2019 Aldo Bergamini. All rights reserved.
//

import UIKit

protocol MainDisplayView: TargetView {
    
    func clearDisplay ()
    func displayPowerfulResult(_ result: Bool, error: Error?)
    func displayComplementResult(_ result: NSInteger, error: Error?)
    func displayFactorialResult(_ result: Double, error: Error?)
}

class ViewController: UIViewController, MainDisplayView {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        mainCoordinator = MainCoordinator(mainController: self)
        mainCoordinator?.start()
    }

    // Private Properties
    
    private var mainCoordinator: Coordinator?
    
    
    // Outlets
    
    @IBOutlet weak var powerfulNoInput: UITextField!
    @IBOutlet weak var powerfulNoOutput: UITextField!
    
    @IBOutlet weak var complementNoInput: UITextField!
    @IBOutlet weak var complementNoOutput: UITextField!
    
    @IBOutlet weak var factorialNoInput: UITextField!
    @IBOutlet weak var factorialNoOutput: UITextField!
    
    
    
    // Outlets

    @IBAction func testPowerfulNumber(_ sender: Any) {
        
        let numberInput = self.powerfulNoInput.text
        
        if let coordinator = self.mainCoordinator as? MainCoordinator {
            
            coordinator.isNumberPowerful(numberInput)
        }
    }
    
    @IBAction func calculateComplementNo(_ sender: Any) {
        
        let numberInput = self.complementNoInput.text
        
        if let coordinator = self.mainCoordinator as? MainCoordinator {
            
            coordinator.calculateComplement(numberInput)
        }
    }
    
    @IBAction func calculateFactorialNo(_ sender: Any) {
        
        let numberInput = self.factorialNoInput.text
        
        if let coordinator = self.mainCoordinator as? MainCoordinator {
            
            coordinator.calculateFactorial(numberInput)
        }
    }
    
    // Main View Interface
    
    func clearDisplay () {
        
        powerfulNoInput.text = ""
        powerfulNoOutput.text = ""
        
        complementNoInput.text = ""
        complementNoOutput.text = ""
        
        factorialNoInput.text = ""
        factorialNoOutput.text = ""
    }
    
    func displayPowerfulResult(_ result: Bool, error: Error?) {
        
        if let error = error {
            
            self.powerfulNoOutput.text = error.localizedDescription
            
        } else if result {
            
            self.powerfulNoOutput.text = "Yes"
            
        } else {
            
            self.powerfulNoOutput.text = "No"
        }
    }
    
    func displayComplementResult(_ result: NSInteger, error: Error?) {
        
        if let error = error {
            
            self.complementNoOutput.text = error.localizedDescription
            
        } else {
            
            self.complementNoOutput.text = "\(result)"
        }
    }
    
    func displayFactorialResult(_ result: Double, error: Error?) {
        
        if let error = error {
            
            self.factorialNoOutput.text = error.localizedDescription
            
        } else {
            
            self.factorialNoOutput.text = "\(result)"
        }
    }
}

