//
//  SwiftTest.swift
//  WalmartApp
//
//  Created by Luis R on 08/09/23.
//

import Foundation


// Exercise 1: Swift Basics
    func sumOfEvenNumbers(_ numbers: [Int]) -> Int {
        var sum = 0
        
        for number in numbers {
            if number % 2 == 0 {
                sum += number
            }
        }
        return sum
    }

/*Exercise 6: View Controller Lifecycle
Topic: iOS App Development
Task:
Explain the iOS view controller lifecycle and list the key methods that are called during different
stages of the lifecycle.*/

// R
/*
 Launch App
 -- Foreground : Inactive
 
 Load Screens
  
 -- Foreground : Active

change app or minimize
 
 -- Foreground : Inactive

 -- Background
 
 -- Not Running
 
 Note:  Apple care about the memory usage, you need asking for use a backgorund task , but have a some limit time usage for download data and another things
 
 */
