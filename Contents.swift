//: Playground - noun: a place where people can play

import UIKit

class Oven {
    var ovenSpace : [Cookie] = []
    var startTime : NSDate?
    var endTime : NSDate?
    
    init() {
        
    }
    
    func bake(_ arrayOfCookie: [Cookie]) {
        startTime = NSDate()
        ovenSpace.append(contentsOf: arrayOfCookie)
    }
    
    func takeOutCookie() {
        endTime = NSDate()
        guard let start = startTime as? Date,
            let end = endTime
            else {return}
        let timeInterval = end.timeIntervalSince(start)
        for cookie in ovenSpace {
            var status = ""
            switch timeInterval {
            case let x where x < cookie.cookTime / 4:
                status = "doughy"
            case let x where x >= cookie.cookTime / 4 && x < cookie.cookTime / 2:
                status = "almost ready"
            case let x where x >= cookie.cookTime / 2 && x <= cookie.cookTime + (cookie.cookTime / 2):
                status = "ready"
            default:
                status = "burnt"
            }
            print("\(cookie.cookTime)")
            print("For \(cookie.type) cookie, the cookie is \(status)")
        }
        ovenSpace.removeAll()
    }
}

class Cookie {
    var type : String = ""
    var cookTime : Double = 0
    
    init(cookieType: String, cookingTime: Double) {
        type = cookieType
        cookTime = cookingTime
    }
}

let oven = Oven()
var cookies : [Cookie] = []
let cookie1 = Cookie.init(cookieType: "Vanilla", cookingTime: 1)
let cookie2 = Cookie.init(cookieType: "Chocolate", cookingTime: 5)
let cookie3 = Cookie.init(cookieType: "Original", cookingTime: 11)
let cookie4 = Cookie.init(cookieType: "Dark", cookingTime: 30)
cookies.append(contentsOf: [cookie1, cookie2, cookie3, cookie4])
oven.bake(cookies)
sleep(5)
oven.takeOutCookie()
