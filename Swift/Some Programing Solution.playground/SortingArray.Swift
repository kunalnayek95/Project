import Foundation

var input = ["credit", "debit", "checking", "debit", "checking", "credit", "debit", "checking", "credit", "debit"]
var order = ["credit": 0, "debit": 1, "checking": 2]

for i in 0..<input.count{
    for j in 0..<input.count - i - 1{
      if order[input[j]]! > order[input[j+1]]!{
        let temp = input[j]
        input[j] = input[j+1]
        input[j+1] = temp
      }
    }
}
print("Sorted arry is: \(input)")
