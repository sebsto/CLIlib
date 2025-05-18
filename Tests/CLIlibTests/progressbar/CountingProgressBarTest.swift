//
//  ProgressBarTest.swift
//  CLIlibTest
//
//  Created by Stormacq, Sebastien on 13/09/2022.
//

import Testing
import Foundation
@testable import CLIlib

@Suite("Counting Progress Bar Tests")
struct CountingProgressBarTest {

    @Test("Counting progress bar should display correctly in single line mode")
    @MainActor
    func testContingSingleLine() {
        // given
        let buffer = StringBuffer()
        let progressBar = ProgressBar(output: buffer, progressBarType: .countingProgressAnimation)
        
        // when
        progressBar.update(step: 1, total: 2, text: "A")
        progressBar.update(step: 2, total: 2, text: "B")
        progressBar.complete(success: true)
        
        // then
        #expect(buffer.string == "[2/2] B\n[ OK ]\n")
    }
}

// Helper extension for debugging purposes
extension String {
    func toHexEncodedString(uppercase: Bool = true,
                            prefix: String = "",
                            separator: String = "") -> String {

        return unicodeScalars.map {
            prefix + .init($0.value, radix: 16, uppercase: uppercase)
        } .joined(separator: separator)
    }
}
