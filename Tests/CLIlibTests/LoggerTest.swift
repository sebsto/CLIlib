//
//  LoggerTest.swift
//  CLIlibTest
//
//  Created by Stormacq, Sebastien on 16/08/2022.
//

import Testing
import Logging
@testable import CLIlib

@Suite("Logger Tests")
struct LoggerTest {
    
    @Test("Default logger should have warning level and correct label")
    func testDefaultLogger() {
        // when
        let log: Logger = Log.defaultLogger()

        // then
        #expect(log.logLevel == .warning)
        #expect(log.label == "CLIlib")
    }

    @Test("Verbose logger should have debug level and correct label")
    func testVerboseLogger() {
        // when
        let log: Logger = Log.verboseLogger()

        // then
        #expect(log.logLevel == .debug)
        #expect(log.label == "CLIlib")
    }

    @Test("Logger should allow changing log level")
    func testLoggerSetLevel() {
        // given
        var log: Logger = Log.defaultLogger()

        // when
        log.logLevel = .trace

        // then
        #expect(log.logLevel == .trace)
    }
}
