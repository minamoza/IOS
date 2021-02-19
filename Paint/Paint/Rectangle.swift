//
//  Rectangle.swift
//  Paint
//
//  Created by Amina Moldamyrza on 2/13/21.
//

import Foundation
import UIKit

class Rectangle: Figure{
    private var p1: CGPoint
    private var p2: CGPoint
    
    init(p1: CGPoint, p2: CGPoint, color: UIColor, stroke_width: CGFloat, isFilled:Bool){
        self.p1 = p1
        self.p2 = p2
        super.init(color: color, stroke_width: stroke_width, isFilled: isFilled)
    }
    
    override func drawPath(){
        let rect = CGRect(origin: p1, size: CGSize(width: abs(p1.x - p2.x), height: abs(p1.y - p2.y)))
        let path = UIBezierPath(rect: rect)
        path.lineWidth = stroke_width
        color.set()
        (isFilled) ? (path.fill()) : (path.stroke())
    }
    
}
