//
//  StepListView.swift
//  StepReps
//
//  Created by Oliver Hu on 8/7/24.
//

import SwiftUI

struct StepListView: View {
    
    let steps: [Step]
    
    var body: some View {
        List(steps) { step in
            HStack {
                    
                Text("\(step.count)")
                if step.count < 3000 {
                    Image(systemName: "flame")
                        .foregroundStyle(.yellow)
                } else if step.count > 3000 && step.count < 6000 {
                    Image(systemName: "flame")
                        .foregroundStyle(.orange)
                } else {
                    Image(systemName: "flame")
                        .foregroundStyle(.red)
                }
                Spacer()
                Text(step.date.formatted(date: .abbreviated, time: .omitted))
            }
        }.listStyle(.plain)
    }
}

#Preview {
    StepListView(steps: [])
}
