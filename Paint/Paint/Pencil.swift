//
//  Pencil.swift
//  Paint
//
//  Created by Amina Moldamyrza on 2/18/21.
//

import UIKit

class Pencil{
    private var point: CGPoint?
    var color: UIColor
    var stroke_width: CGFloat = 0.0
    
    init(point: CGPoint, color: UIColor, stroke_width: CGFloat) {
        self.point = point
        self.color = color
        self.stroke_width = stroke_width
    }
}
