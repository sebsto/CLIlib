//
//  Display.swift
//  CLIlib
//
//  Created by Stormacq, Sebastien on 26/09/2022.
//

import Foundation

@MainActor
public protocol DisplayProtocol {
    func display(_ msg: String, terminator: String)
}

@MainActor
public struct Display: DisplayProtocol {
    public init() {}
    public func display(_ msg: String, terminator: String) {
        print(msg, terminator: terminator)
    }
}
