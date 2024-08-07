//
//  ContentView.swift
//  StepReps
//
//  Created by Oliver Hu on 8/7/24.
//

import SwiftUI


struct ContentView: View {
    
    @State private var healthStore = HealthStore()

    
    private var steps: [Step] {
        healthStore.steps.sorted { lhs, rhs in
            lhs.date > rhs.date
        }
    }
    
    var body: some View {
        VStack {
            if let step = steps.first {
                TodayStepView(step: step)
            }
            
            StepListView(steps: steps)
            
            
            
        }
            .task {
            await healthStore.requestAuthorization()
            do {
                try await healthStore.calculateSteps()
            } catch {
                print(error)
            }
        }
        .padding()
        .navigationTitle("Step Reps")
    }
}
#Preview {
    ContentView()
}
