//
//  File.swift
//  loadie
//
//  Created by Austin Xu on 2568/1/26.
//

import Foundation
import SwiftUI

struct StepDetailView: View {
    let step: CpuStep

    var body: some View {
        VStack(spacing: 20) {
            Text(step.title)
                .font(.largeTitle)
                .bold()
            Image(systemName: step.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            Text(step.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
        .padding()
        .presentationDetents([.medium, .large])
    }
}
