//
//  Line.swift
//  Paint
//
//  Created by Amina Moldamyrza on 2/18/21.
//

import UIKit

class Line: Figure {
    private var p1: CGPoint
    private var p2: CGPoint
    
    init(p1: CGPoint, p2: CGPoint, color: UIColor, stroke_width: CGFloat){
        self.p1 = p1
        self.p2 = p2
        super.init(color: color, stroke_width: stroke_width, isFilled: false)
    }
    
    override func drawPath() {
        let aPath = UIBezierPath()

        aPath.move(to: CGPoint(x:p1.x, y:p1.y))
        aPath.addLine(to: CGPoint(x: p2.x, y: p2.y))

        // Keep using the method addLine until you get to the one where about to close the path
        aPath.close()

        // If you want to stroke it with a red color
        color.set()
        aPath.lineWidth = stroke_width
        aPath.stroke()
    }
}
