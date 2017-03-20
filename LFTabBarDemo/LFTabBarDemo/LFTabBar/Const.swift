//
//  Const.swift
//  LFPicScrollView
//
//  Created by 吴林丰 on 2017/3/14.
//  Copyright © 2017年 吴林丰. All rights reserved.
//

import Foundation
import UIKit

let version:NSString = UIDevice.current.systemVersion as NSString
let shareAppdelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
let kIOS7 = version.floatValue >= 7.0 ? 1 : 0
let kIOS8 = version.floatValue >= 8.0 ? 1 : 0

let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width

func x(object:UIView) -> CGFloat {
     return object.frame.origin.x
}

func y(object:UIView) -> CGFloat {
    return object.frame.origin.y
}

func w(object:UIView) -> CGFloat {
    return object.frame.size.width
}

func h(object:UIView) -> CGFloat {
    return object.frame.size.height
}


func RGBCOLOR(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor{
    return UIColor.init(red: r, green: g, blue: b, alpha: 1.0)
}


