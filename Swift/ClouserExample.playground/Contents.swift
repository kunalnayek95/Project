import UIKit
//MARK: - ========================================================Start
//MARK: - Simple Clouser
let clouser1: () -> () = { print("Hello clouser") } //Clouser

let clouser2 = { print("Hello clouser") } //Same as previous

let clouser3: (String) -> Void = { name in
    print(name)
}
let sumClouser: (Int , Int) -> Int = { (a,b) in
    return a + b
}

//clouser1()
//clouser3("Hello Clouser")
//let answer = sumClouser(20, 10)
//print(answer)

//MARK: - Clouser As parameter

func closuserFun(name: String, clouser: (String) -> ()){
    let str = name.capitalized
    clouser(str)
}

//1 way of call
//closuserFun(name: "kunal nayek", clouser: { name in
//    print(name)
//})

//2nd way of call
//closuserFun(name: "kunal nayek") { name in
//    print(name)
//}

//3rd way of call

let printName: (String) -> () = { name in
    print(name)
}

//closuserFun(name: "kunal nayek", clouser: printName)

// Bydefault all clouser are now nonescaping

//Escaping Clouser
func closuserEsc(name: String, clouser: @escaping (String) -> ()){
    print("Start of clouser func")
    let str = name.capitalized
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
        clouser(str)
    }
    print("End of Clouser func")
}

//closuserEsc(name: "kunal nayek") { name in
//    print(name)
//}




//MARK: - Clouser as return type
func sayIt() -> (String) -> Void{
    return{ str in
        print(str)
    }
}
//sayIt()("Jai Hind") //We do it by this way but generally we don't do this way.
//let temp = sayIt()
//temp("Jai Hind")




//MARK: - Capture Values

func counter() -> () -> Void{
    var count = 1
    return{
        print("Counter is now \(count)")
        count += 1
    }
}

let gameCounter = counter()
gameCounter() // print 1
gameCounter() // print 2

/* Because clouser is reference type and that hola the value of previous increment */


//MARK: - ====================================================End
