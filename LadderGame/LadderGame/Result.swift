//
//  Display.swift
//  LadderGame
//
//  Created by 이동건 on 17/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct Result{
    
    private enum Bridge: String{
        case exist = "-----"
        case none = "     "
    }
    
    private var element: [[Bool]]
    private var applicants: [LadderPlayer]
    
    init(element: [[Bool]], applicants: [LadderPlayer]) {
        self.element = element
        self.applicants = applicants
    }
    
    func generateDisplayForm() -> [String] {
        var displayForm = element.map {generateLadderDisplayForm(stage: $0)}
        displayForm.append(generateApplicantsDisplayForm(applicants))
        return displayForm
    }
    
    private func generateLadderDisplayForm(stage: [Bool]) -> String {
        let displayForm = stage.reduce("   |") { (result, isBridge) -> String in
            let bridge = isBridge ? Bridge.exist.rawValue : Bridge.none.rawValue
            return "\(result)\(bridge)|"
        }
        return displayForm
    }
    
    private func generateApplicantsDisplayForm(_ applicants: [LadderPlayer]) -> String {
        return applicants.map {addBlank(to: $0.name)}.joined()
    }
    
    // 이름들을 일정한 간격을 두고 출력하기 위해
    private func addBlank(to name: String)-> String {
        var value = name
        for i in 0..<(5 - value.count + 1) { // 5 = maximum name input
            i % 2 == 0 ? value.insert(" ", at: value.startIndex) : value.insert(" ", at: value.endIndex)
        }
        return value
    }
}