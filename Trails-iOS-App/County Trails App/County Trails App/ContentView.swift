//
//  ContentView.swift
//  County Trails App
//
//  Created by Matthew Plater on 5/3/25.
//


import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WebViewModel()
    @State private var showToolbar = true
    @State private var lastOffsetY: CGFloat = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollTrackingWebView(
                url: URL(string: "http://localhost:5001")!,
                viewModel: viewModel
            ) { offsetY in
                if offsetY < lastOffsetY - 10 {
                    withAnimation { showToolbar = true }
                } else if offsetY > lastOffsetY + 10 {
                    withAnimation { showToolbar = false }
                }
                lastOffsetY = offsetY
            }
            .edgesIgnoringSafeArea(.all)

            if showToolbar {
                HStack {
                    Button(action: { viewModel.goBack() }) {
                        Image(systemName: "chevron.left")
                    }
                    .disabled(!viewModel.canGoBack)

                    Spacer()

                    Button(action: { viewModel.reload() }) {
                        Image(systemName: "arrow.clockwise")
                    }

                    Spacer()

                    Button(action: { viewModel.goForward() }) {
                        Image(systemName: "chevron.right")
                    }
                    .disabled(!viewModel.canGoForward)
                }
                .padding()
                .background(Color(hex: "#344D35"))
                .foregroundColor(.white)
                .clipShape(Capsule())
                .shadow(radius: 5)
                .padding(.bottom, 30)
                .padding(.horizontal, 40)
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }
}
