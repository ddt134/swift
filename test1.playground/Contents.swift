//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground";
var int=42;
func test1( abc string:String)->String{
    let string = string
    //var string = abc;
    //string="aaaa";
    print(string);
    return "bbb";
    //return string;
    
}

test1(abc:str);

//let text = "abcdefghi"
//let index2 = text.startIndex
//var a=(text as NSString).substring(with: NSMakeRange(4, 1))


func findDigit(_ num:Int, _ nth: Int) -> Int {
    // Go.
    if nth<=0{
        return -1;
    }
    let numString:String=String(num);
    let length:Int=Int(numString.characters.count);
    if length<nth{
        return 0;
    }
    let res=numString[numString.index(numString.startIndex,offsetBy:length-nth-1)];
    return Int(String(res))!;
    
}

findDigit(6429, 3);

//func findDigit(_ num:Int, _ nth: Int) -> Int {
//    
//}

//var test:String="abcdefg";
//var res=test.index(test.startIndex,offsetBy:1);
//print(res);
func bouncingBall(_ h: Double, _ bounce: Double, _ window: Double) -> Int {
    // your code
    if(h<=0||bounce<=0||bounce>=1||window>=h){
        return -1;
    }
    var foo=h*bounce;
    var times=1;
    while (foo>window){
        foo=foo*bounce;
        times+=2;
    }
    return times;
}

bouncingBall(3, 0.66, 1.5);


