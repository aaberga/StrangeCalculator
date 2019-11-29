//
//  MainCoordinator.swift
//  StrangeCalculator
//
//  Created by Aldo Bergamini on 26/11/2019.
//  Copyright © 2019 Frequency Communications. All rights reserved.
//

import UIKit



class MainCoordinator: Coordinator {
    
    var viewController: TargetView
    
    func start() {
        
        self.resetDisplay()
    }
    
    init(mainController: TargetView) {
        
        self.viewController = mainController
    }
    
    // Helpers
   
   func resetDisplay() {
       
       if let viewController = self.viewController as? ViewController {
           
           viewController.clearDisplay()
       }
   }

    
    // Logical Interface Methods
    
    func powerfulNumbers(from inputStart: String?, to inputEnd: String?) {
        
    }

    func isNumberPowerful(_ input: String?) {
        
        if let input = input {
            
            if let integerInput = NSInteger(input) {
                
                let isPowerful = self.numberIsPowerful(integerInput)
                
                if let view = self.viewController as? MainDisplayView {
                    
                    view.displayPowerfulResult(isPowerful, error: nil)
                }
            }
        }    }
    
    
    func calculateComplement(_ input: String?) {
        
    }
    
        
    func calculateFactorial(_ input: String?) {
        
        if let input = input {
            
            if let doubleInput = Double(input) {
                
                let factorial = self.factorial(doubleInput)
                
                if let view = self.viewController as? MainDisplayView {
                    
                    view.displayFactorialResult(factorial, error: nil)
                }
            }
        }
    }
    
    // Private Methods
    
    func factorial(_ input: Double) -> Double {
        
        if input == 0.0 {
            
            return 1
            
        } else {
            
            let nextSmaller = input - 1.0
            
            return input * self.factorial(nextSmaller)
        }
    }
    
    
    func numberIsPowerful(_ input: NSInteger) -> Bool {
        
        var n = input
        
        while (n / 2) == 0 {
            
            var power = 0
            while (n / 2) == 0 {
                
                n = n/2
                power = power + 1
                
                // If only 2 ^ 1 divides
                // n (not higher powers),
                // then return false
                
                if power == 1 {
                    return false
                }
            }
        }
        
        let first = 3
        let last = Int(sqrt(Double(input)))
        let interval = 2
        
        for factor in stride(from: first, through: last+1, by: interval) {
        
              // Find highest power of "factor" that divides n
              var power = 0;
              while (n % factor == 0) {
                  n = n / factor;
                  power+=1;
              }
        
              // If only factor^1 divides n (not higher powers),
              // then return false
            if (power == 1) {
                  return false;
            }
          }
        
          // n must be 1 now if it is not a prime numenr.
          // Since prime numbers are not powerful, we return
          // false if n is not 1.
          return (n == 1);
    }
}



/*

### FROM: GeeksforGeeks

# https://www.geeksforgeeks.org/powerful-number/

# Python program to find
# if a number is powerful or not.
import math

# function to check if
# the number is powerful
def isPowerful(n):

    # First divide the number repeatedly by 2
    while (n % 2 == 0):

        power = 0
        while (n % 2 == 0):
        
            n = n//2
            power = power + 1
        
        
        # If only 2 ^ 1 divides
        # n (not higher powers),
        # then return false
        if (power == 1):
            return False
    

    # if n is not a power of 2
    # then this loop will execute
    # repeat above process
    for factor in range(3, int(math.sqrt(n))+1, 2):
    
        # Find highest power of
        # "factor" that divides n
        power = 0
        while (n % factor == 0):
        
            n = n//factor
            power = power + 1
        

        # If only factor ^ 1 divides
        # n (not higher powers),
        # then return false
        if (power == 1):
            return false
    

    # n must be 1 now if it
    # is not a prime numenr.
    # Since prime numbers are
    # not powerful, we return
    # false if n is not 1.
    return (n == 1)

# Driver code

print("YES" if isPowerful(20) else "NO")
print("YES" if isPowerful(27) else "NO")


# This code is contributed
# by Anant Agarwal.

*/
