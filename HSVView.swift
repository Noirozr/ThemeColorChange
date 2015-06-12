//
//  HSVView.swift
//  ThemeColorChange
//
//  Created by Noirozr on 15/6/13.
//  Copyright (c) 2015年 Yongjia Liu. All rights reserved.
//

import UIKit

class HSVView: UIView {
    
    var hue: Float!
    var saturation: Float!
    var value: Float!
    
    /*
    max=max(R,G,B):
    min=min(R,G,B)
    V=max(R,G,B)
    S=(max-min)/max:
    HSV颜色空间模型（圆锥模型）
    HSV颜色空间模型（圆锥模型）[2]
    ifR = max,H =(G-B)/(max-min)* 60
    ifG = max,H = 120+(B-R)/(max-min)* 60
    ifB = max,H = 240 +(R-G)/(max-min)* 60
    ifH < 0,H = H+ 360
    */

    func setColor(red: Float, green: Float, blue: Float) {
        
        var maxValue = max(red, green, blue)
        var minValue = min(red, green, blue)
        
        value = maxValue
        saturation = (maxValue - minValue) / maxValue
        
        if maxValue == minValue {
            hue = 0
        } else if red == maxValue && green >= blue {
            hue = (green - blue) / (maxValue - minValue) * 60
        } else if red == maxValue && green < blue {
            hue = (green - blue) / (maxValue - minValue) * 60 + 360
        } else if green == maxValue {
            hue = (blue - red) / (maxValue - minValue) * 60 + 120
        } else if blue == maxValue {
            hue = (red - green) / (maxValue - minValue) * 60 + 240
        }
        
        self.backgroundColor = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1.0)
    }

//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func changeTheme(add: Float) {
        var red, green, blue : Float
        hue = hue + add
        
        var i = (hue / 60) % 6
        var f = hue / 60 - i
        
        var p = value * (1 - saturation)
        var q = value * (1 - f * saturation)
        var t = value * (1 - (1 - f) * saturation)
        
        switch Int(i) {
        case 0:
            red = value; green = t; blue = p
        case 1:
            red = q; green = value; blue = p
        case 2:
            red = p; green = value; blue = t
        case 3:
            red = p; green = q; blue = value
        case 4:
            red = t; green = p; blue = value
        case 5:
            red = value; green = p; blue = q
        default:
            red = 0; green = 0; blue = 0
        }
        println(i)
        
        self.backgroundColor = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1.0)
        println(red)
        println(green)
        println(blue)
    }
}
