//
//  File.swift
//  loadie
//
//  Created by Austin Xu on 2568/1/26.
//

import Foundation

struct CpuStep: Identifiable, Equatable{
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
}
