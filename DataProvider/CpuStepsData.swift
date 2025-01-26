//
//  File.swift
//  loadie
//
//  Created by Austin Xu on 2568/1/26.
//

import Foundation

struct CpuStepsData{
    // CPU Steps Data
    static let cpuSteps = [
        CpuStep(title: "Instruction Fetch", description: "The CPU fetches the instruction from memory.", imageName: "arrow.down.circle"),
        CpuStep(title: "Instruction Decode", description: "The CPU decodes the fetched instruction to understand what needs to be done.", imageName: "list.bullet.rectangle"),
        CpuStep(title: "Execution", description: "The CPU executes the decoded instruction using its ALU or other components.", imageName: "bolt.circle"),
        CpuStep(title: "Memory Access", description: "The CPU accesses memory if required, for loading data or writing results.", imageName: "memorychip"),
        CpuStep(title: "Write Back", description: "The CPU writes the result of the execution back to memory or a register.", imageName: "checkmark.circle")
    ]
}
