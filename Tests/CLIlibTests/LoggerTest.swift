//
//  LoggerTest.swift
//  CLIlibTest
//
//  Created by Stormacq, Sebastien on 16/08/2022.
//

import XCTest
import Logging
@testable import CLIlib

class LoggerTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDefaultLogger() throws {

        // given
        // when
        let log: Logger = Log.defaultLogger()

        // then
        XCTAssert(log.logLevel == .warning)
        XCTAssert(log.label == "CLIlib")
    }

    func testVerboseLogger() throws {

        // given
        // when
        let log: Logger = Log.verboseLogger()

        // then
        XCTAssert(log.logLevel == .debug)
        XCTAssert(log.label == "CLIlib")
    }

    func testLoggerSetLevel() throws {

        // given
        var log: Logger = Log.defaultLogger()

        // when
        log.logLevel = .trace

        // then
        XCTAssert(log.logLevel == .trace)
    }

}
