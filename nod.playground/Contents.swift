import UIKit

var array = [2, 10, 12, 14, 21, 99, 67, 2882]
let f = array.sorted()

//алгоритм евклида для наибольшего общего делителя, можно было через остаток от деления
func nod(a: Int, b: Int)-> Int{
    var x = a
    var y = b
    while x != y{
        if x > y{
            x = x - y
        }
        else{
            y = y - x
        }
    }
    return x
}
func nok(a: [Int])->Int{
    let filterArray = a.sorted()
    
    guard let i = filterArray.last else {fatalError("массив пустой")}
    
    let x = i
    let y = filterArray[filterArray.count - 2]
    
    let n = x*y/nod(a: x, b: y)
    var localN = n
    var t = 0
    while t != 3 {
        for element in filterArray{  // когда прошлись полностью по массиву надо пройтись еще раз
            while localN % element != 0 {
                localN += n
            }
        }
        t += 1
    }
    
    return localN
}
nok(a: array)

