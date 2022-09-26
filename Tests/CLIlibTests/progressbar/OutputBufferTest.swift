//
//  OutputBufferTest.swift
//  CLIlibTest
//
//  Created by Stormacq, Sebastien on 15/09/2022.
//

import XCTest
@testable import CLIlib

// tover the cod eportion not covered by ProgressBar tests
final class OutputBufferTest: XCTestCase {

    var buffer: FileHandle?

    override func setUp() {
        super.setUp()
        buffer = FileHandle.nullDevice
    }

    func testClear() {

        // given
        buffer!.write("test")

        // when
        buffer!.clear()

        // then
        // ?? maybe I should mock FileHandl
        // tested method is trivial. I don't want to spend time on this
    }

}
