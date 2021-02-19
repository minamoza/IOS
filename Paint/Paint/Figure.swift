//
//  Figure.swift
//  Paint
//
//  Created by Amina Moldamyrza on 2/14/21.
//

import Foundation
import UIKit

class Figure{
    var color: UIColor
    var stroke_width: CGFloat = 0.0
    var isFilled: Bool
    
    init(color: UIColor, stroke_width: CGFloat, isFilled: Bool){
        self.color = color
        self.stroke_width = stroke_width
        self.isFilled = isFilled
    }
    
    func drawPath()  {
    }
}
