//
//  main.swift
//  xYLadder
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// 입력값이 홀수일때 "|" 짝수일떄 "" 리턴하는 함수
func yLadderFromOdd(inputNumber : Int) -> String{
    if inputNumber % 2 == 0 {
        return "|"
    }
    else {
        return " "
    }
}

// 입력값이 짝수면 거짓, 홀수면 참 리턴
func isItOdd(inputNumber : Int) -> Bool{
    return inputNumber % 2 == 1
}

//


// 어레이를 받아서 카운트를 리턴
func countOf(inputArray : Array<Any>) -> Int {
    return inputArray.count
}

//0부터 입력받은 숫자-1 까지의 홀수만 출력
func oddsListUntil(number : Int)->Array<Int>{
    let first = 0
    let last = number
    let interval = 2
    var onlyForOdd = Array<Int>()
    let sequence = stride(from: first, to: last, by: interval)
    
    for element in sequence {
        onlyForOdd.append(element)
    }
    
    
    return onlyForOdd
}

// 50%의 확률로 참 리턴
func halfChance()->Bool{
    if arc4random_uniform(2)==0 {
        return true
    } else {
        return false
    }
}

// 가로배열 생성하는 함수
func makePeopleLadder(heads : Int) -> Array<String>{
    var peopleLadderOnly = Array<String>()
    
    for x in (0..<heads) {
        peopleLadderOnly.append(yLadderFromOdd(inputNumber: x))
    }
    return peopleLadderOnly
}

// 배열을 이쁘게 리턴해주는 함수
func lettersFrom(inputArray : Array<String>) -> String{
    var letters = ""
    for something in inputArray {
        letters += something
    }
    return letters
}

// 확률로 가로사다리나 공백 리턴
func xLadderByChance()->String{
    if halfChance(){
        return "-"
    } else {
        return " "
    }
}

// 앞칸의 가로사다리 여부를 받아서 있으면 빈칸, 없으면 확률로 사다리를 리턴
func xLadderAfter(beforeLadder : String) -> String{
    if beforeLadder == " "{
        return xLadderByChance()
    }
    return " "
}

//배열을 입력 받아서 가로사다리를 넣고 배열을 리턴
func makeXLadder(afterPeopleLadder : Array<String>) -> Array<String>{
    var peopleAndXLadder = afterPeopleLadder
    let oddFromInput = oddsListUntil(inputArray: peopleAndXLadder)
    // 앞자리 가로사다리 여부 변수
    var aheadXLadder = " "
    for countArray in oddFromInput{
        // 앞앞자리 가로사다리가 있는지 체크 후 없으면 대입, 앞자리변수에도 대입
        if aheadXLadder == " "  {
            aheadXLadder = xLadderByChance()
            peopleAndXLadder[countArray] = aheadXLadder
        }
            // 앞앞자리 가로사다리가 없으면 없다고 체크
        else {
            aheadXLadder = " "
        }
    }
    return peopleAndXLadder
}

// 입력값 두개를 받아서 사다리게임 배열 출력
func makeXYladder(peopleCount : Int, ladderCount : Int) -> String{
    var xYLadder=""
    for _ in (0..<ladderCount){
        let arr = makePeopleLadder(heads: peopleCount*2-1)
        let arr2 = makeXLadder(afterPeopleLadder: arr)
        xYLadder += lettersFrom(inputArray: arr2)
        xYLadder += "\n"
    }
    return xYLadder
}

//입력받는 함수
func recieveUserInput()->String {
    //유저 입력을 받아서 userInput 에 입력
    if let userInput = readLine(){
        return userInput
    }
    else {
        return ""
    }
}

// 문자열을 인트로 변경
func numberFrom(letters : String)->Int?{
    guard let number = Int(letters) else {
        return nil
    }
    return number
}

// 유저입력을 두번 받아서 인트형으로 리턴
func inputTwice()->(peopleNumber:Int,yLadderNumber:Int)?{
    // 인원수 입력메세지 출력
    print("참여할 사람은 몇 명 인가요?")
    guard let peopleNumber = numberFrom(letters: recieveUserInput()) else {
        print("잘못된 인원 입력입니다")
        return nil
    }
    // 인원수 입력메세지 출력
    print("최대 사다리 높이는 몇 개인가요?")
    guard let yLadderNumber = numberFrom(letters: recieveUserInput()) else {
        print("잘못된 개수 입력입니다")
        return nil
    }
    return (peopleNumber,yLadderNumber)
}

func main(){
    //  입력값을 받아서 각 변수에 저장한다.
    guard let (peopleNumber,yLadderNumber) = inputTwice() else {
        return ()
    }

    print(makeXYladder(peopleCount: peopleNumber, ladderCount: yLadderNumber))
}

main()


























