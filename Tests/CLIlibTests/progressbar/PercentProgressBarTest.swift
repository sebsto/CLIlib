//
//  ProgressBarTest.swift
//  CLIlibTest
//
//  Created by Stormacq, Sebastien on 13/09/2022.
//

import Testing
import Foundation
@testable import CLIlib

@Suite("Percent Progress Bar Tests")
struct PercentProgressBarTest {

    @Test("Empty progress bar should display correctly")
    @MainActor
    func testEmpty() {
        // given
        let buffer = StringBuffer()
        let progressBar = createProgressBar(buffer: buffer)
        
        // when
        progressBar.update(step: 0, total: 100, text: "")
        
        // then
        #expect(buffer.string == "0% [------------------------------------------------------------]")
    }

    @Test("Empty progress bar with text should display correctly")
    @MainActor
    func testEmptyWithText() {
        // given
        let buffer = StringBuffer()
        let progressBar = createProgressBar(buffer: buffer)
        
        // when
        progressBar.update(step: 0, total: 100, text: "Label")
        
        // then
        #expect(buffer.string == "0% [------------------------------------------------------------] Label")
    }

    @Test("Full progress bar should display correctly")
    @MainActor
    func testFull() {
        // given
        let buffer = StringBuffer()
        let progressBar = createProgressBar(buffer: buffer)
        
        // when
        progressBar.update(step: 100, total: 100, text: "")
        
        // then
        #expect(buffer.string == "100% [🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢]\n")
    }

    @Test("Partial progress bar should display correctly")
    @MainActor
    func testPartial() {
        // given
        let buffer = StringBuffer()
        let progressBar = createProgressBar(buffer: buffer)
        
        // when
        progressBar.update(step: 43, total: 100, text: "")
        
        // then
        #expect(buffer.string == "43% [🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢🁢-----------------------------------]")
    }
    
    // Helper method to create a progress bar with consistent settings
    @MainActor
    private func createProgressBar(buffer: StringBuffer) -> ProgressBar {
        let progressBarImpl: ProgressBar = ProgressBar(output: buffer, progressBarType: .percentProgressAnimation)
        progressBarImpl.fullSign = "🁢"
        progressBarImpl.emptySign = "-"
        return progressBarImpl
    }
}
