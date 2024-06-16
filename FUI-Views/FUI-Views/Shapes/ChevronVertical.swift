//
//  ChevronVertical.swift
//  FUI-Views
//
//  Created by IVAN CAMPOS on 6/15/24.
//

import SwiftUI

struct ChevronVertical: Shape {
    let chevronWidth: CGFloat
    let chevronHeight: CGFloat
    let lineThickness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: chevronHeight / 2))
        path.addLine(to: CGPoint(x: chevronWidth / 2, y: 0))
        path.addLine(to: CGPoint(x: chevronWidth, y: chevronHeight / 2))
        path.move(to: CGPoint(x: lineThickness, y: chevronHeight / 2))
        path.addLine(to: CGPoint(x: chevronWidth / 2, y: lineThickness))
        path.addLine(to: CGPoint(x: chevronWidth - lineThickness, y: chevronHeight / 2))
        
        return path
    }
}
