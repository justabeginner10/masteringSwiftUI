//
//  RectangleToCircleView.swift
//  MasteringSwiftUI
//
//  Created by Aditya on 28/08/24.
//

import SwiftUI

struct RectangleToCircleView: View {
    @State private var recordBegin = false
    @State private var recording = false
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: recordBegin ? 30 : 5)
                .frame(width: recordBegin ? 60 : 250, height: 60)
                .foregroundColor(recordBegin ? .red : .green)
                .overlay(
                    Image(systemName: "mic.fill")
                        .font(.system(.title))
                        .foregroundStyle(.white)
                        .scaleEffect(recording ? 0.7 : 1)
                )
            
            RoundedRectangle(cornerRadius: recordBegin ? 35 : 10)
                .trim(from: 0, to: recordBegin ? 0.0001 : 1)
                .stroke(lineWidth: 5)
                .frame(width: recordBegin ? 70 : 260, height: 70)
                .foregroundStyle(.green)
            
        }
        .onTapGesture {
            withAnimation(.default) {
                self.recordBegin.toggle()
            }
            
            withAnimation(.default.repeatForever().delay(0.5)) {
                self.recording.toggle()
            }
        }
    }
}

#Preview {
    RectangleToCircleView()
}
