import UIKit

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
func nok(from a: Int, to b: Int) -> Int{
    guard a < b && a != 0 && b != 0 else {fatalError("некорректный ввод чисел")}
    
    let x = b - 1
    let y = b
    
    let nok_ = x * y / nod(a: x, b: y)
    var localNok = nok_
    var h = 0
    
    // когда прошлись полностью по массиву надо пройтись еще раз чтобы проверить что нашли наименьшее общее кратное для всех, но как по умному сделать проверку сколько раз проходить не придумал
    while h != b {
        for num in a...b {
            while localNok % num != 0 {
                localNok += nok_
            }
        }
        h += 1
    }
    
    return localNok
}

nok(from: 1, to: 10)
