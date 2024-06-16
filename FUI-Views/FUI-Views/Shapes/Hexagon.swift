//
//  Hexagon.swift
//  FUI-Views
//
//  Created by IVAN CAMPOS on 6/15/24.
//

import SwiftUI

struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        let yOffset: CGFloat = height / 2

        path.move(to: CGPoint(x: width / 2, y: 0))
        path.addLine(to: CGPoint(x: width, y: yOffset / 2))
        path.addLine(to: CGPoint(x: width, y: yOffset + yOffset / 2))
        path.addLine(to: CGPoint(x: width / 2, y: height))
        path.addLine(to: CGPoint(x: 0, y: yOffset + yOffset / 2))
        path.addLine(to: CGPoint(x: 0, y: yOffset / 2))
        path.closeSubpath()

        return path
    }
}
