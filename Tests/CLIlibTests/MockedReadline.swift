//
//  MockedReadLine.swift
//  CLIlibTests
//
//  Created by Stormacq, Sebastien on 26/09/2022.
//

import Foundation
@testable import CLIlib

// mocked read line
class MockedReadLine: ReadLineProtocol {

    var input: [String]

    public init(_ input: [String]) {
        self.input = input.reversed()
    }

    public func readLine(prompt: String, silent: Bool = false) -> String? {
        return input.popLast()
    }
}
