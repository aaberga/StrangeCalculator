//
//  MainCoordinator.swift
//  StrangeCalculator
//
//  Created by Aldo Bergamini on 26/11/2019.
//  Copyright © 2019 Frequency Communications. All rights reserved.
//

import UIKit



class MainCoordinator: Coordinator {
    
    // MARK: Properties
    
    var viewController: TargetView
    
    
    // MARK: - Coordinator Interface
    
    func start() {
        
        self.resetDisplay()
    }
    
    // MARK: - Life Cycle
    
    init(mainController: TargetView) {
        
        self.viewController = mainController
    }
    
    // MARK: - Helpers
    
    func resetDisplay() {
        
        if let viewController = self.viewController as? MainDisplayView {
            
            viewController.clearDisplay()
        }
    }
    
    
    
    // MARK: - Logical Interface Methods
    
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
    
    
    /*
     A complement of a number is defined as the inversion (if the bit value = 0, change it to 1 and vice-versa) of all bits of the number starting from the leftmost bit that is set to 1.
     For example: If N = 5, N is represented as 101 in binary. The complement of N is 010, which is 2 in decimal notation. Similarly if N = 50, then the complement of N is 13.
     Complete the function computeComplement:(int)N. This function accepts N as parameter. The function should return the complement of N.
     */
    func calculateComplement(_ input: String?) {
        
        if let input = input {
            
            if let integerInput = NSInteger(input) {
                
                let complement = self.complement(integerInput)
                
                if let view = self.viewController as? MainDisplayView {
                    
                    view.displayComplementResult(complement, error: nil)
                }
            }
        }
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
    
    // MARK: - Private Methods
    
    func factorial(_ input: Double) -> Double {
        
        if input == 0.0 {
            
            return 1
            
        } else {
            
            let nextSmaller = input - 1.0
            
            return input * self.factorial(nextSmaller)
        }
    }
    
    /* A powerful number is a positive integer m that for every prime number p dividing m, p*p also divides m. (a prime number (or a prime) is a natural number that has exactly two (distinct) natural number divisors, which are 1 and the prime number itself, the first prime numbers are: 2, 3, 5, 7, 11, 13, ...)
     The first powerful numbers are: 1, 4, 8, 9, 16, 25, 27, 32, 36, ...
     For example, 4 is a powerful number because all the primes that divide it (2 alone) also divide it when squared, and so forth.
     Please implement this method to return the count of powerful numbers in the range [from..to] inclusively. */
    /**/
    
    func numberIsPowerful(_ input: NSInteger) -> Bool {
        
        var n = input
        
        while (n.isMultiple(of: 2)) {
            
            var power = 0
            while (n.isMultiple(of: 2)) {
                
                let (q, _) = n.quotientAndRemainder(dividingBy: 2)
                n = q
                power = power + 1
                
                // If only 2 ^ 1 divides
                // n (not higher powers),
                // then return false
            }
            
            if power == 1 {
                return false
            }
        }
        
        let first = 3
        let last = Int(sqrt(Double(n)))
        let interval = 2
        
        for factor in stride(from: first, through: last, by: interval) {
            
            // Find highest power of "factor" that divides n
            var power = 0
            while (n.isMultiple(of: factor)) {
                
                let (q, _) = n.quotientAndRemainder(dividingBy: factor)
                n = q;
                power = power + 1
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

        return (n == 1)
    }
    
    
    func complement(_ input: NSInteger) -> NSInteger {
        
        return 0
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
