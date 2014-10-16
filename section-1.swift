// Playground - noun: a place where people can play

import UIKit

class FibonacciSequence {
    
    let includesZero: Bool
    let values: [Int]
    
    init(maxNumber: Int, includesZero: Bool) {
        self.includesZero = includesZero
        var fibArray: [Int] = [0,1,1]
        var arrayNumber = 2
        while  arrayNumber <= maxNumber {
            fibArray.append(arrayNumber)
            let lastNumber = fibArray.last!
            let secondToLast = fibArray[fibArray.count - 2]
            arrayNumber = lastNumber + secondToLast
        }
        
        // Removes the 0 if it shouldn't be included.
        if includesZero == false {
            fibArray.removeAtIndex(0)
        }
        

        // Removes the numbers 1 if maxNumer == 0, and 0 is the start
        if maxNumber == 0 && includesZero == true   {
            fibArray.removeAtIndex(2)
            fibArray.removeAtIndex(1)
        }
        
        // Empties Array if 0 is not the beggining and maxNumber == 0
        if maxNumber == 0 && includesZero == false   {
            fibArray = [Int] ()
        }

     values = fibArray
    }

    init(numberOfItemsInSequence: Int, includesZero: Bool) {
        self.includesZero = includesZero
        var fibArray: [Int] = [0,1,1]
        var arrayNumber = 2
        
        if includesZero == false {
            fibArray.removeAtIndex(0)
        }
        
        if includesZero == true  && (numberOfItemsInSequence == 1 || numberOfItemsInSequence == 2) {
            fibArray.removeAtIndex(2)
        }
        
        switch numberOfItemsInSequence {
        case 0:
            fibArray.removeAtIndex(1)
            fibArray.removeAtIndex(0)
        case 1:
            fibArray.removeAtIndex(1)
        case 2:
            values = fibArray
        default:
            for var index = 3; index < numberOfItemsInSequence; ++index {
                fibArray.append(fibArray[fibArray.count - 2] + fibArray.last!)
            }
        }
    values = fibArray
    }
}

let fibanocciSequence = FibonacciSequence(maxNumber: 1234, includesZero: false)
let anotherSequence = FibonacciSequence(numberOfItemsInSequence: 3, includesZero: true)
