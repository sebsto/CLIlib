//
//  Logger.swift
//  CLILib
//
//  Created by Stormacq, Sebastien on 14/08/2022.
//

import Foundation
import Logging

// defines a global logger that we could reuse through the project
public let log: Logger = Log.defaultLogger()

public struct Log {

    // defines a default logger
    public static func defaultLogger(logLevel: Logger.Level = .warning, label: String = "") -> Logger {
        let log = Log(logLevel: logLevel, label: label)
        return log.logger
    }
    public static func verboseLogger(logLevel: Logger.Level = .debug, label: String = "") -> Logger {
        let log = Log(logLevel: logLevel, label: label)
        return log.logger
    }

    private var logger: Logger
    private init(logLevel: Logger.Level = .warning, label: String = "") {
        logger = Logger(label: label == "" ? "CLIlib" : label)
        logger.logLevel = logLevel    
    }
    

    // mutating func setLogLevel(level: Logger.Level) {
    //     defaultLogger.logLevel = level
    // }
}
