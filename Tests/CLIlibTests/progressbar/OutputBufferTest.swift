//
//  OutputBufferTest.swift
//  CLIlibTest
//
//  Created by Stormacq, Sebastien on 15/09/2022.
//

import Testing
import Foundation
@testable import CLIlib

@Suite("Output Buffer Tests")
struct OutputBufferTest {

    @Test("Buffer clear should work correctly")
    func testClear() {
        // given
        let buffer = FileHandle.nullDevice
        buffer.write("test")

        // when
        buffer.clear()

        // then
        // Note: This is a trivial method and we're just ensuring it doesn't crash
        // The original test noted that proper mocking of FileHandle would be needed for more thorough testing
    }
}
