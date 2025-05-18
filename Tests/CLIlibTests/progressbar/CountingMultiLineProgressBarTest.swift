//
//  ProgressBarTest.swift
//  CLIlibTest
//
//  Created by Stormacq, Sebastien on 13/09/2022.
//

import XCTest
@testable import CLIlib

final class CountingMultiLineProgressBarTest: XCTestCase {

    var progressBar: ProgressUpdateProtocol!
    var buffer: StringBuffer!

    override func setUp() {
        super.setUp()
    
        buffer = StringBuffer()
        
        // Initialize progressBar in the test method instead
        progressBar = nil
    }

    @MainActor
    func testContingMultiline() async throws {
            // Initialize ProgressBar here on the main actor
            progressBar = ProgressBar(output: buffer, progressBarType: .countingProgressAnimationMultiLine)
            
            progressBar.update(step: 1, total: 2, text: "A")
            progressBar.update(step: 2, total: 2, text: "B")
            progressBar.complete(success: true)
            XCTAssertEqual(buffer.string,
                           "[1/2] A\n[2/2] B\n[ OK ]\n")
    }

}
