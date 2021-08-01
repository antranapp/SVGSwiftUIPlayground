//
//  File.swift
//
//
//  Created by An Tran on 1/8/21.
//

import Foundation
import UIKit
import SwiftUI
import SVGKit

public struct SVGImageView: UIViewRepresentable {
    let svg: String
    let contentMode: UIView.ContentMode
    let tintColor: UIColor?

    public init(
        _ svg: String,
        contentMode: UIView.ContentMode = .scaleAspectFit,
        tintColor: UIColor? = nil
    ) {
        self.svg = svg
        self.contentMode = contentMode
        self.tintColor = tintColor
    }

    public func makeUIView(context: Context) -> SVGKFastImageView {

        let url = Bundle.main.url(forResource: svg, withExtension: "svg")
        let svgImage = SVGKImage(contentsOf: url)
        return SVGKFastImageView(svgkImage: svgImage ?? SVGKImage())
    }

    public func updateUIView(_ uiView: SVGKFastImageView, context: Context) {
        uiView.contentMode = contentMode
        if self.tintColor != nil {
            uiView.tintColor = tintColor
        }
    }
}
