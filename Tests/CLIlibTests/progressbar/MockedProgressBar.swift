//
//  MockedprogressBar.swift
//  CLIlib
//
//  Created by Stormacq, Sebastien on 26/09/2022.
//

import Foundation
@testable import CLIlib

class MockedProgressBar: ProgressUpdateProtocol {

    var isComplete = false
    var isClear    = false
    var step  = 0
    var total = 0
    var text  = ""

    func update(step: Int, total: Int, text: String) {
        self.step  = step
        self.total = total
        self.text  = text
    }

    func complete(success: Bool) {
        isComplete = success
    }

    func clear() {
        isClear = true
    }

}
