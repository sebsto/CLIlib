//
//  ProgressBarTest.swift
//  CLIlibTest
//
//  Created by Stormacq, Sebastien on 13/09/2022.
//

import Testing
import Foundation
@testable import CLIlib

@Suite("Counting Multi-Line Progress Bar Tests")
struct CountingMultiLineProgressBarTest {

    @Test("Counting progress bar should display correctly in multi-line mode")
    @MainActor
    func testContingMultiline() {
        // given
        let buffer = StringBuffer()
        let progressBar = ProgressBar(output: buffer, progressBarType: .countingProgressAnimationMultiLine)
        
        // when
        progressBar.update(step: 1, total: 2, text: "A")
        progressBar.update(step: 2, total: 2, text: "B")
        progressBar.complete(success: true)
        
        // then
        #expect(buffer.string == "[1/2] A\n[2/2] B\n[ OK ]\n")
    }
}
