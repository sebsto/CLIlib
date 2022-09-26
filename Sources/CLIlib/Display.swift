//
//  Display.swift
//  CLIlib
//
//  Created by Stormacq, Sebastien on 26/09/2022.
//

import Foundation

protocol DisplayProtocol {
    func display(_ msg: String, terminator: String)
}

struct Display: DisplayProtocol {
    func display(_ msg: String, terminator: String) {
        print(msg, terminator: terminator)
    }
}
