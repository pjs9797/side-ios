#!/usr/bin/swift
import Foundation

func handleSIGINT(_ signal: Int32) {
    exit(0)
}

signal(SIGINT, handleSIGINT)

enum LayerType: String {
    case feature = "Feature"
    case domain = "Domain"
    case core = "Core"
    case shared = "Shared"
}

enum MicroTargetType: String {
    case interface = "Interface"
    case sources = ""
}

let fileManager = FileManager.default
let currentPath = "./"
let bash = Bash()

func registerModuleDependency() {
    registerModulePaths()
    makeProjectDirectory()

    let layerPrefix = layer.rawValue.lowercased()
    let moduleEnum = ".\(layerPrefix)(.\(moduleName))"
    var targetString = "[\n"
    if hasInterface {
        makeScaffold(target: .interface)
        targetString += "\(tab(2)).interface(module: \(moduleEnum)),\n"
    }
    targetString += "\(tab(2)).implements(module: \(moduleEnum)"
    if hasInterface {
        targetString += ", dependencies: [\n\(tab(3)).\(layerPrefix)(target: .\(moduleName), type: .interface)\n\(tab(2))])"
    } else {
        targetString += ")"
    }
    
    targetString += "\n\(tab(1))]"
    makeProjectSwift(targetString: targetString)
    makeSourceScaffold()
}

func tab(_ count: Int) -> String {
    var tabString = ""
    for _ in 0..<count {
        tabString += "    "
    }
    return tabString
}

func registerModulePaths() {
    updateFileContent(
        filePath: currentPath + "Plugins/DependencyPlugin/ProjectDescriptionHelpers/Modules.swift",
        finding: "enum \(layer.rawValue): String, CaseIterable {\n",
        inserting: "        case \(moduleName)\n"
    )
    print("Register \(moduleName) to Modules.swift")
}


func makeDirectory(path: String) {
    do {
        try fileManager.createDirectory(atPath: path, withIntermediateDirectories: false, attributes: nil)
    } catch {
        fatalError("❌ failed to create directory: \(path)")
    }
}

func makeDirectories(_ paths: [String]) {
    paths.forEach(makeDirectory(path:))
}

func makeProjectSwift(targetString: String) {
    let projectSwift = """
import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePath.\(layer.rawValue).name+ModulePath.\(layer.rawValue).\(moduleName).rawValue,
    targets: \(targetString)
)

"""
    writeContentInFile(
        path: currentPath + "Projects/\(layer.rawValue)/\(moduleName)/Project.swift",
        content: projectSwift
    )
}

func makeProjectDirectory() {
    makeDirectory(path: currentPath + "Projects/\(layer.rawValue)/\(moduleName)")
}

func makeSourceScaffold() {
    _ = try? bash.run(
        commandName: "tuist",
        arguments: ["scaffold", "Sources", "--name", "\(moduleName)", "--layer", "\(layer.rawValue)"]
    )
}

func makeScaffold(target: MicroTargetType) {
    _ = try? bash.run(
        commandName: "tuist",
        arguments: ["scaffold", "\(target.rawValue)", "--name", "\(moduleName)", "--layer", "\(layer.rawValue)"]
    )
}

func writeContentInFile(path: String, content: String) {
    let fileURL = URL(fileURLWithPath: path)
    let data = Data(content.utf8)
    try? data.write(to: fileURL)
}

func updateFileContent(
    filePath: String,
    finding findingString: String,
    inserting insertString: String
) {
    let fileURL = URL(fileURLWithPath: filePath)
    guard let readHandle = try? FileHandle(forReadingFrom: fileURL) else {
        fatalError("❌ Failed to find \(filePath)")
    }
    guard let readData = try? readHandle.readToEnd() else {
        fatalError("❌ Failed to find \(filePath)")
    }
    try? readHandle.close()

    guard var fileString = String(data: readData, encoding: .utf8) else { fatalError() }
    fileString.insert(contentsOf: insertString, at: fileString.range(of: findingString)?.upperBound ?? fileString.endIndex)

    guard let writeHandle = try? FileHandle(forWritingTo: fileURL) else {
        fatalError("❌ Failed to find \(filePath)")
    }
    writeHandle.seek(toFileOffset: 0)
    try? writeHandle.write(contentsOf: Data(fileString.utf8))
    try? writeHandle.close()
}

// MARK: - Starting point

print("레이어 이름을 입력해주세요 ❗️대소문자를 반드시 구별해주세요❗️\n(Feature | Domain | Core | Shared)", terminator: " : ")
let layerInput = readLine()
guard
    let layerInput,
    !layerInput.isEmpty,
    let layerUnwrapping = LayerType(rawValue: layerInput)
else {
    print("레이어 이름 입력 오류")
    exit(1)
}
let layer = layerUnwrapping
print("레이어: \(layer.rawValue)\n")

print("모듈 이름을 입력해주세요", terminator: " : ")
let moduleInput = readLine()
guard let moduleNameUnwrapping = moduleInput, !moduleNameUnwrapping.isEmpty else {
    print("모듈 이름 입력 오류")
    exit(1)
}
var moduleName = moduleNameUnwrapping
print("모듈명: \(moduleName)\n")

print("This module has a 'Interface' Target? (y\\n, default = n)", terminator: " : ")
let hasInterface = readLine()?.lowercased() == "y"

print("")

registerModuleDependency()

print("")
print("------------------------------------------------------------------------------------------------------------------------")
print("레이어: \(layer.rawValue)")
print("모듈명: \(moduleName)")
print("인터페이스: \(hasInterface)")
print("------------------------------------------------------------------------------------------------------------------------")
print("✅ 모듈 생성 성공 ✅")

// MARK: - Bash
protocol CommandExecuting {
    func run(commandName: String, arguments: [String]) throws -> String
}

enum BashError: Error {
    case commandNotFound(name: String)
}

struct Bash: CommandExecuting {
    func run(commandName: String, arguments: [String] = []) throws -> String {
        return try run(resolve(commandName), with: arguments)
    }

    private func resolve(_ command: String) throws -> String {
        guard var bashCommand = try? run("/bin/bash", with: ["-l", "-c", "which \(command)"]) else {
            throw BashError.commandNotFound(name: command)
        }
        bashCommand = bashCommand.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        return bashCommand
    }

    private func run(_ command: String, with arguments: [String] = []) throws -> String {
        let process = Process()
        process.launchPath = command
        process.arguments = arguments
        let outputPipe = Pipe()
        process.standardOutput = outputPipe
        process.launch()
        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(decoding: outputData, as: UTF8.self)
        return output
    }
}
