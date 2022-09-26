//
//  Logger.swift
//  CLILib
//
//  Created by Stormacq, Sebastien on 14/08/2022.
//

import Foundation
import Logging

public var log: Logger = Log().defaultLogger

struct Log {

    // defines a global logger that we could reuse through the project
    public var defaultLogger: Logger

    public init(logLevel: Logger.Level = .warning, label: String = "") {

        defaultLogger = Logger(label: label == "" ? "CLIlib" : label)
        defaultLogger.logLevel = logLevel
    }

    mutating func setLogLevel(level: Logger.Level) {
        defaultLogger.logLevel = level
    }
}
