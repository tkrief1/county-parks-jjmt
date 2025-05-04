//
//  LaunchView.swift
//  County Trails App
//
//  Created by Matthew Plater on 5/3/25.
//


import SwiftUI

struct LaunchView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Text("County Trails Enhancement")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "#344D35"))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation { isActive = true }
                }
            }
        }
    }
}
