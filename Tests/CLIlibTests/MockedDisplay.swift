//
//  MockedDisplay.swift
//  CLIlibTests
//
//  Created by Stormacq, Sebastien on 26/09/2022.
//

import Foundation
@testable import CLIlib

class MockedDisplay: DisplayProtocol {
    var string: String = ""

    func display(_ msg: String, terminator: String) {
        self.string = msg + terminator
    }
}
