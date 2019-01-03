import UIKit

var array = [2, 10, 12, 14, 21, 99, 67, 2882]

//алгоритм евклида для наибольшего общего делителя, можно было через остаток от деления
func nod(a: Int, b: Int) -> Int{
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
func nok(a: [Int]) -> Int{
    let filterArray = a.sorted()
    
    guard let i = filterArray.last else {fatalError("массив пустой")}
    
    let x = i
    let y = filterArray[filterArray.count - 2]
    
    let nok_ = x * y / nod(a: x, b: y)
    var localNok = nok_
    var t = 0
    
    // когда прошлись полностью по массиву надо пройтись еще раз чтобы проверить что нашли наименьшее общее кратное, как сделать проверку сколько раз проходить не придумал сделал 4 раза =)
    while t != 3 {
        for element in filterArray{
            while localNok % element != 0 {
                localNok += nok_
            }
        }
        t += 1
    }
    
    return localNok
}

nok(a: array)

