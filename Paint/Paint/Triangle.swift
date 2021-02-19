//
//  Triangle.swift
//  Paint
//
//  Created by Amina Moldamyrza on 2/13/21.
//

import Foundation
import UIKit

class Triangle: Figure {
    private var p1: CGPoint
    private var p2: CGPoint
    
    init(p1: CGPoint, p2: CGPoint, color: UIColor, stroke_width: CGFloat, isFilled: Bool){
        self.p2 = p2
        self.p1 = p1
        super.init(color: color, stroke_width: stroke_width, isFilled: isFilled)
    }
    
    override func drawPath(){
        let path = UIBezierPath.init()

        path.move(to: CGPoint(x: p1.x, y: p1.y))
        path.addLine(to: CGPoint(x: p2.x,y: p1.y))
        path.addLine(to: CGPoint(x: p1.x, y: p2.y))

        path.close()

        color.set()
        path.lineWidth = stroke_width
        (isFilled) ? (path.fill()) : (path.stroke())
    }
}
