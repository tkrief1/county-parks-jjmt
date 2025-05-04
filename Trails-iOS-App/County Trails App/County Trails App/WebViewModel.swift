//
//  WebViewModel.swift
//  County Trails App
//
//  Created by Matthew Plater on 5/3/25.
//

import SwiftUI
import WebKit

class WebViewModel: ObservableObject {
    @Published var canGoBack = false
    @Published var canGoForward = false

    var webView: WKWebView?

    func goBack() {
        webView?.goBack()
    }

    func goForward() {
        webView?.goForward()
    }

    func reload() {
        webView?.reload()
    }
}
