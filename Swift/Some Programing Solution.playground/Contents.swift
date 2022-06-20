import UIKit
import Foundation

// MARK: - Remove elements from an array
var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
let indexesToRemove = [3, 5, 8, 12]

numbers = numbers.enumerated().filter{!indexesToRemove.contains($0.offset)}.map{$0.element}

print(numbers)




//Pascel triangle
//Time Complexity: O(n^2)
//Space Complexity: O(n^2)
func pacselTriangle(_ nunberOfRow: Int) -> [[Int]]{
    guard nunberOfRow>0 else{
        return []
    }
    if nunberOfRow == 1 {return [[1]]}
    
    var result = [[Int]]()
    result.reserveCapacity(nunberOfRow)
    result.append([1])
    
    for i in 1..<nunberOfRow{
        var newRow = [1]
        let preRow = result[i-1]
        
        for j in 1..<preRow.count{
            let sum = preRow[j] + preRow[j-1]
            newRow.append(sum)
        }
        newRow.append(1)
        
        result.append(newRow)
    }
    return result
}

let result = pacselTriangle(5)

for res in result{
    print(res)
}

//print(result)

