//
//  Circle.swift
//  Paint
//
//  Created by Amina Moldamyrza on 2/13/21.
//

import Foundation
import UIKit

class Circle: Figure{
    private var radius: CGFloat = 0.0
    private var circle_center: CGPoint
    
    init(with radius: CGFloat, and circle_center: CGPoint, withSome color: UIColor, and stroke_width: CGFloat, isFilled: Bool){
        self.circle_center = circle_center
        self.radius = radius
        super.init(color: color, stroke_width: stroke_width, isFilled: isFilled)
    }
    
    override func drawPath(){
        let path = UIBezierPath(arcCenter: circle_center,
                                radius: radius,
                                startAngle: 0,
                                endAngle: 2*Double.pi.cg,
                                clockwise: true)
        path.lineWidth = stroke_width
        color.set()
        (isFilled) ? (path.fill()) : (path.stroke())
    }
}
extension Double{
    var cg: CGFloat{
        return CGFloat(self)
    }
}

