//
//  SwiftUIView.swift
//  loadie
//
//  Created by Austin Xu on 2568/1/26.
//

import SwiftUI

struct CpuStepsView: View {
    
    //MARK: - Properties
    @State private var selectedStep: CpuStep? = nil
    @State private var completedSteps: Int = 0
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(Array(CpuStepsData.cpuSteps.enumerated()), id: \.element.id) { index, step in
                    VStack {
                        Button(action: {
                            // Provide haptic feedback when button is tapped
                            let generator = UIImpactFeedbackGenerator(style: .light)
                            generator.impactOccurred()

                            // Simulate completing a step
                            if completedSteps <= index {
                                completedSteps = index + 1
                            }
                            selectedStep = step
                        }) {
                            VStack {
                                Image(systemName: step.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(index == completedSteps ? Color.blue.opacity(0.2) : (index < completedSteps ? .blue : Color.gray))
                                    .padding()
                                    .background(
                                        Circle()
                                            .stroke(index == completedSteps ? Color.blue.opacity(0.2) : (index < completedSteps ? .blue : Color.gray), lineWidth: 3)
                                    )
                                    .scaleEffect(selectedStep == step ? 1.05 : 1.0)
                                    .animation(.easeInOut(duration: 0.2), value: selectedStep)
                                
                                Text(step.title)
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 8)
                            }
                        }
                        
                        // Vertical connecting line between steps
                        if index != CpuStepsData.cpuSteps.count - 1 {
                            Rectangle()
                                .frame(width: 2, height: 50)
                                .foregroundColor(index < completedSteps ? .blue : .gray)
                                .animation(.easeInOut, value: completedSteps)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .sheet(item: $selectedStep) { step in
                StepDetailView(step: step)
            }
        }
        .navigationTitle("CPU Basics")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // Do Refresh action
                    completedSteps = 0
                    selectedStep = nil
                } label: {
                    if #available(iOS 18.0, *) {
                        Image(systemName: "arrow.clockwise")
                            .symbolEffect(.rotate)
                    } else {
                        Image(systemName: "arrow.clockwise")
                    }
                }
            }
        }
    }
}

#Preview {
    CpuStepsView()
}

