[![Build And Test]()
![language](https://img.shields.io/badge/swift-5.7-blue)
![platform](https://img.shields.io/badge/platform-macOS-green)
[![license](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

# CLIlib

A set of classes to build command-line (CLI) applications in Swift.

## User I/O

### Displaying information to users

```swift
public protocol DisplayProtocol {
    func display(_ msg: String, terminator: String)
}
```

### Requesting information from users 

```swift
public protocol ReadLineProtocol {
    func readLine(prompt: String, silent: Bool) -> String?
}
```

### Example usage

```swift
// the display implementation to display messages to users, allows to inject a mock for testing
var display: DisplayProtocol = Display()

// the input function to collect user entry, allows to inject a mocked implementation for testing
var input: ReadLineProtocol = ReadLine()

display("Retrieving Apple Developer Portal credentials...")

guard let username = input.readLine(prompt: "⌨️  Enter your Apple ID username: ", silent: false) else {
    throw CLIError.invalidInput
}

guard let password = input.readLine(prompt: "⌨️  Enter your Apple ID password: ", silent: true) else {
    throw CLIError.invalidInput
}

enum CLIError: Error {
    case invalidInput
}
```

## ProgressBar 

```swift
public enum ProgressBarType {
    
    // 30% [============--------------------]
    case percentProgressAnimation
    
    // [ 1/2 ]
    case countingProgressAnimation

    // [ 1/2 ]
    // [ 2/2 ]
    case countingProgressAnimationMultiLine
}
```

```swift
public protocol ProgressUpdateProtocol {
    /// Update the animation with a new step.
    /// - Parameters:
    ///   - step: The index of the operation's current step.
    ///   - total: The total number of steps before the operation is complete.
    ///   - text: The description of the current step.
    func update(step: Int, total: Int, text: String)

    /// Complete the animation.
    /// - Parameters:
    ///   - success: Defines if the operation the animation represents was succesful.
    func complete(success: Bool)

    /// Clear the animation.
    func clear()
}
```

### Example Usage

```swift
let stream: OutputBuffer = FileHandle.standardOutput
let progress = ProgressBar(output: stream, progressBarType: .percentProgressAnimation, title: "Downloading...")
progress.update(1, 10, "Downloading...")
...
progress.update(10, 10, "Downloading...")
progress.complete(true)
```

## Shell

Asynchronously run shell commands.

```swift
public protocol AsyncShellProtocol: ShellProtocol {
    func run(_ command: String,
             onCompletion: ((Process) -> Void)?,
             onOutput: ((String) -> Void)?,
             onError: ((String) -> Void)?
            ) throws -> Process
}
```

### Example Usage

```swift
public func run(_ command: String) throws -> ShellOutput {

    var stdOutBuffer: String = ""
    var stdErrBuffer: String = ""
    var result: ShellOutput?
    
    let sema: DispatchSemaphoreProtocol = DispatchSemaphore( value: 0 )
    
    let shell = AsyncShell()
    let process = try shell.run(command,
                                onCompletion: { process in
        result = ShellOutput(out: stdOutBuffer, err: stdErrBuffer, code: process.terminationStatus)
        _ = sema.signal()
    },
                                onOutput: { string in
        stdOutBuffer += string
    },
                                onError: { string in
        stdErrBuffer += string
    })
    
    process.waitUntilExit()
    
    // wait for onCompletion callback to finish
    sema.wait()
    
    guard let res = result else {
        fatalError("Process finished but there is no output!")
    }
    return res
}
```

