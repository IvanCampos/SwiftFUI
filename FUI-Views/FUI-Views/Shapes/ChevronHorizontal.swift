//
//  ChevronHorizontal.swift
//  FUI-Views
//
//  Created by IVAN CAMPOS on 6/15/24.
//

import SwiftUI

struct ChevronHorizontal: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.size.width * 2
        let height = rect.size.height * 2
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width / 2, y: height / 2))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: width / 4, y: height))
        path.addLine(to: CGPoint(x: width * 3 / 4, y: height / 2))
        path.addLine(to: CGPoint(x: width / 4, y: 0))
        path.closeSubpath()
        
        return path
    }
}
