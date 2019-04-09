import Foundation
/// 사람과 사다리의 수를 입력받는 함수
func inputCount()->(countOfPeople:Int,countOfLadder:Int) {
    print("참여할 사람은 몇 명 인가요?")
    let countOfPeopleText = readLine()
    print("최대 사다리 높이는 몇 개인가요?")
    let countOfLadderText = readLine()
    
    guard let countOfPeople = Int(countOfPeopleText!) else { return (0,0) }
    guard let countOfLadder = Int(countOfLadderText!) else { return (0,0) }
    
    return (countOfPeople,countOfLadder)
}

/// 사람의 숫자와 사다리의 숫자를 입력 받아 사다리를 만들고 출력하는 함수
func makeLadder(_ countOfPeople:Int, _ countOfLadder:Int)->[[String]] {
    guard countOfPeople <= 0 || countOfLadder <= 0 else{
        var ladders :[[String]] = [[]]
        var horizontalLadder:String
        
        // 사람의 숫자와 사다리의 숫자를 바탕으로 사다리의 모양을 2차원 배열에 저장
        for ladderIndex in 0...countOfLadder-1 {
            ladders.append([])
            for peopleIndex in 0...countOfPeople-1 {
                ladders[ladderIndex].append("|")
                let judgmentLadder = arc4random_uniform(2)
                
                horizontalLadder = "-"
                if judgmentLadder == 0 || (peopleIndex>=1 && ladders[ladderIndex][(2 * peopleIndex) - 1] == "-") { horizontalLadder = " " }
                
                ladders[ladderIndex].append(horizontalLadder)
            }
            ladders[ladderIndex].removeLast()
        }
        return ladders
    }
    return [[""]]
}

/// 2차원 배열 출력함수
func outputLadder(_ ladders:[[String]]) {
    guard ladders == [[""]]
    else {
        for peopleIndex in ladders {
            for ladderIndex in peopleIndex{
                print(ladderIndex, terminator:"")
            }
            print("")
        }
        return
    }
    print("0보다 큰 정수를 입력해주세요!")
}
let inputNumber = inputCount()
let ladders = makeLadder(inputNumber.countOfPeople,inputNumber.countOfLadder)
outputLadder(ladders)
