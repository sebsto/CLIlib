//
//  Readline.swift
//  CLIlib
//
//  Created by Stormacq, Sebastien on 26/09/2022.
//

import Foundation

public protocol ReadLineProtocol {
    func readLine(prompt: String, silent: Bool) -> String?
}

public struct ReadLine: ReadLineProtocol {
    public init() {}
    public func readLine(prompt: String, silent: Bool = false) -> String? {
        if silent {
            return String(cString: getpass(prompt))
        } else {
            Display().display(prompt, terminator: "")
            return Swift.readLine()
        }
    }
}
