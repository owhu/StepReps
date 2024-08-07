//
//  TodayStepView.swift
//  StepReps
//
//  Created by Oliver Hu on 8/7/24.
//

import SwiftUI

struct TodayStepView: View {
    
    let step: Step
    
    var body: some View {
        
        
        HStack {
      
                if step.count < 3000 {
                    Image(.charmanderPixel)
                        .resizable()
                        .scaledToFit()
                } else if step.count > 3000 && step.count < 6000 {
                    Image(.charmeleonPixel)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(.charizardPixel)
                        .resizable()
                        .scaledToFit()
                }
            
            Text("\(step.count) steps")
                .font(.largeTitle)
                .foregroundStyle(.orange)

            
        }
        .frame(maxWidth: .infinity, maxHeight: 150)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
        
        .overlay(alignment: .bottomTrailing) {
            Text(step.date.formatted(date: .abbreviated, time: .omitted))
                .foregroundStyle(.orange)
                .font(.caption)
                .padding()
        }
    }
}


