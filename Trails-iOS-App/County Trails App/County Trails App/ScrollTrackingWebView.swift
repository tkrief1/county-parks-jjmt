//
//  ScrollTrackingWebView.swift
//  County Trails App
//
//  Created by Matthew Plater on 5/3/25.
//


import SwiftUI
import WebKit

struct ScrollTrackingWebView: UIViewRepresentable {
    let url: URL
    @ObservedObject var viewModel: WebViewModel
    let onScroll: (CGFloat) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(viewModel: viewModel, onScroll: onScroll)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        viewModel.webView = webView
        webView.scrollView.delegate = context.coordinator
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {}

    class Coordinator: NSObject, WKNavigationDelegate, UIScrollViewDelegate {
        var viewModel: WebViewModel
        let onScroll: (CGFloat) -> Void

        init(viewModel: WebViewModel, onScroll: @escaping (CGFloat) -> Void) {
            self.viewModel = viewModel
            self.onScroll = onScroll
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            viewModel.canGoBack = webView.canGoBack
            viewModel.canGoForward = webView.canGoForward
        }

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            onScroll(scrollView.contentOffset.y)
        }
    }
}
