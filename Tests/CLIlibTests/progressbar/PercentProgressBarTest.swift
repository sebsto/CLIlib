//
//  ProgressBarTest.swift
//  CLIlibTest
//
//  Created by Stormacq, Sebastien on 13/09/2022.
//

import XCTest
@testable import CLIlib

final class PercentProgressBarTest: XCTestCase {

    var progressBar: ProgressUpdateProtocol? = nil
    var buffer: StringBuffer!

    override func setUp() {
        super.setUp()
        buffer = StringBuffer()
    }

    @MainActor
    private func createProgressBar() -> ProgressBar{
        let progressBarImpl: ProgressBar = ProgressBar(output: buffer, progressBarType: .percentProgressAnimation)
        progressBarImpl.fullSign = "🁢"
        progressBarImpl.emptySign = "-"
        return progressBarImpl
    }
    @MainActor
    func testEmpty() {
        let progressBar = createProgressBar()
        progressBar.update(step: 0, total: 100, text: "")
        XCTAssertEqual(buffer.string,
                       "0% [------------------------------------------------------------]")
    }

    @MainActor
    func testEmptyWithText() {
        let progressBar = createProgressBar()
        progressBar.update(step: 0, total: 100, text: "Label")
        XCTAssertEqual(buffer.string,
                       "0% [------------------------------------------------------------] Label")
    }

    @MainActor
    func testFull() {
        let progressBar = createProgressBar()
        progressBar.update(step: 100, total: 100, text: "")
        XCTAssertEqual(buffer.string,
                       "100% [🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢]\n")
    }

    @MainActor
    func testPartial() {
        let progressBar = createProgressBar()
        progressBar.update(step: 43, total: 100, text: "")
        XCTAssertEqual(buffer.string,
                       "43% [🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢-----------------------------------]")
    }

}
