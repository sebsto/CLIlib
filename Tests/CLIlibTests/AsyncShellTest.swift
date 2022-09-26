//
//  AsyncShellTest.swift
//  CLIlibTest
//
//  Created by Stormacq, Sebastien on 20/08/2022.
//

import XCTest
@testable import CLIlib

class AsyncShellTest: XCTestCase {

    var expectation: XCTestExpectation?
    var oneLineError: String?
    var oneLineOutput: String?
    var terminationCode: Int32?

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func call(_ command: String) throws -> Process {
        expectation = self.expectation(description: "running a process")

        let shell = AsyncShell()
        let process = try shell.run(command,
                                    onCompletion: { _ in
            self.expectation!.fulfill()
        },
                                    onOutput: { string in
            self.oneLineOutput = string
        },
                                    onError: { string in
            self.oneLineError = string
        })

        process.waitUntilExit()

        return process

    }

    func testCommandSucceeds() throws {

        do {
            // given
            let command = "echo 'seb'"

            // when
            _ = try call(command)

            // then
            XCTAssertNil(oneLineError)
            XCTAssertNotNil(oneLineOutput)
            let out = try XCTUnwrap(oneLineOutput)
            XCTAssertTrue(out.contains("seb\n"))
            waitForExpectations(timeout: 5)

        } catch {
            XCTAssert(false, "Unexpected exception thown : \(error)")
        }
    }

    func testSyncCommandSucceeds() throws {

        do {
            // given
            let shell   = AsyncShell()
            let command = "echo 'seb'"

            // when
            let result: ShellOutput = try shell.run(command)

            // then
            XCTAssertNotNil(result.out)
            XCTAssertEqual(result.out!, "seb\n")
            XCTAssertNotNil(result.err)
            XCTAssertEqual(result.err!, "")
            XCTAssertEqual(0, result.code)

        } catch {
            XCTAssert(false, "Unexpected exception thown : \(error)")
        }
    }

    func testCommandFails() throws {

        do {
            // given
            let command = "false"

            // when
            let process = try call(command)

            // then
            XCTAssertEqual(process.terminationStatus, 1)
            XCTAssertNil(oneLineError)
            XCTAssertNil(oneLineOutput)
            waitForExpectations(timeout: 5)

        } catch {
            XCTAssert(false, "Unexpected exception thown : \(error)")
        }
    }

    func testCommandDoesNotExist() throws {

        do {
            // given
            let command = "xxx"

            // when
            let process = try call(command)

            // then
            XCTAssertEqual(process.terminationStatus, 127)
            XCTAssertNotNil(oneLineError)
            XCTAssertNil(oneLineOutput)
            let err = try XCTUnwrap(oneLineError)
            XCTAssertEqual(err, "zsh:1: command not found: xxx\n")
            waitForExpectations(timeout: 5)

        } catch {
            XCTAssert(false, "Unexpected exception thown : \(error)")
        }
    }

}
