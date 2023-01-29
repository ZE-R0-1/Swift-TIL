import Foundation

let input1 = readLine()!.components(separatedBy: " ")
let input2 = readLine()!.components(separatedBy: " ")
for i in input2 {
    if Int(i)! < Int(input1[1])! {
        print(i, terminator: " ")
    }
}
