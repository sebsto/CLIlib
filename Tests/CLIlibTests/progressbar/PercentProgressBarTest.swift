//
//  ProgressBarTest.swift
//  CLIlibTest
//
//  Created by Stormacq, Sebastien on 13/09/2022.
//

import XCTest
@testable import CLIlib

final class PercentProgressBarTest: XCTestCase {

    var progressBar: ProgressUpdateProtocol!
    var buffer: StringBuffer!

    override func setUp() {
        super.setUp()
        buffer = StringBuffer()
        let progressBarImpl = ProgressBar(output: buffer, progressBarType: .percentProgressAnimation)
        progressBarImpl.fullSign = "🁢"
        progressBarImpl.emptySign = "-"
        progressBar = progressBarImpl
    }

    func testEmpty() {
        progressBar.update(step: 0, total: 100, text: "")
        XCTAssertEqual(buffer.string,
                       "0% [------------------------------------------------------------]")
    }

    func testEmptyWithText() {
        progressBar.update(step: 0, total: 100, text: "Label")
        XCTAssertEqual(buffer.string,
                       "0% [------------------------------------------------------------] Label")
    }

    func testFull() {
        progressBar.update(step: 100, total: 100, text: "")
        XCTAssertEqual(buffer.string,
                       "100% [🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢]\n")
    }

    func testPartial() {
        progressBar.update(step: 43, total: 100, text: "")
        XCTAssertEqual(buffer.string,
                       "43% [🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢-----------------------------------]")
    }

}
