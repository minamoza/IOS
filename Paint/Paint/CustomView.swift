//
//  CustomView.swift
//  Paint
//
//  Created by Amina Moldamyrza on 2/13/21.
//

import UIKit

class CustomView: UIView {
    var point1: CGPoint?
    var point2: CGPoint!
    var width = CGFloat(1)
    var fill = true
    var figure: Figure?
    var line = [CGPoint]()
    var figure_type = "rect"
    var figures:[Figure] = []
    var color = UIColor.green
    
    override func draw(_ rect: CGRect) {
        for i in figures{
            i.drawPath()
        }
    }
    
    func addDraw() {
        // Drawing code
        if let p1 = point1{
            switch figure_type{
                case "circ":
                    figure = Circle.init(with: abs(p1.x - point2.x)/2, and: CGPoint(x: p1.x + abs(p1.x - point2.x)/2, y: p1.y + abs(p1.y - point2.y)/2), withSome: color, and: width, isFilled: fill)
                    figures.append(figure!)
                case "rect":
                    figure = (Rectangle.init(p1: p1, p2: point2, color: color, stroke_width: width, isFilled: fill))
                    figures.append(figure!)
                case "tri":
                    figure = (Triangle.init(p1: p1, p2: point2, color: color, stroke_width: width, isFilled: fill))
                    figures.append(figure!)
                case "line":
                    figure = (Line.init(p1: p1, p2: point2, color: color, stroke_width: width))
                    figures.append(figure!)
                default:
                    break
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            point1 = touch.location(in: self)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            point2 = touch.location(in: self)
        }
        addDraw()
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let touch = touches.first {
                if figure_type == "pencil" {
                    point2 = touch.location(in: self)
                    figures.append(Line.init(p1: point1!, p2: point2, color: color, stroke_width: width))
                    point1 = point2
                    setNeedsDisplay()
                }
            }
        }
    
    @IBAction func circle(_ sender: UIButton) {
        figure_type = "circ"
    }
    
    @IBAction func rectangle(_ sender: UIButton) {
        figure_type = "rect"
    }
    
    @IBAction func triangle(_ sender: UIButton) {
       figure_type = "tri"
    }
    
    @IBAction func line(_ sender: UIButton) {
      figure_type = "line"
    }
    
    @IBAction func pencil(_ sender: UIButton) {
        figure_type = "pencil"
    }
    
    @IBAction func back(_ sender: UIButton) {
        if !figures.isEmpty{
            figures.removeLast()
        }
        setNeedsDisplay()
    }
    
    @IBAction func trash(_ sender: UIButton) {
        if !figures.isEmpty{
            figures.removeAll()
        }
        setNeedsDisplay()
    }
    
    @IBAction func scale(_ sender: UISlider) {
        width = CGFloat(sender.value)
    }
    
    @IBAction func fill(_ sender: UISwitch) {
        fill = sender.isOn
    }
    
    @IBAction func YellowBTN(_ sender: UIButton) {
        color = UIColor.yellow
    }
    
    @IBAction func GreenBTN(_ sender: UIButton) {
        color = UIColor.green
    }
    
    @IBAction func BlueBTN(_ sender: UIButton) {
        color = UIColor.blue
    }
    
    @IBAction func RedBTN(_ sender: UIButton) {
        color = UIColor.red
    }
    
    @IBAction func OrangeBTN(_ sender: UIButton) {
        color = UIColor.orange
    }
    

}
