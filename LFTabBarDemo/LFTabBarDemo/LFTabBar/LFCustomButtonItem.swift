//
//  LFCustomButtonItem.swift
//  LFTabBarDemo
//
//  Created by 吴林丰 on 2017/3/20.
//  Copyright © 2017年 吴林丰. All rights reserved.
//

import UIKit

class LFCustomButtonItem: UIButton {
    
    // MARK: - 页面所用属性
    private let itemWH = 40  //item的大小
    private let itemTitleColor = UIColor.colorWithHexString(hex: "7b7b7b") //item  中默认的字体颜色
    private let selectedItemTitleColor = UIColor.colorWithHexString(hex: "e2231a")  //item中被选中是字体的颜色
    private let itemTitleFont = UIFont.systemFont(ofSize: 10) //item中字体的大小
    private let badgeValueViewImageName = "badge_one@2x.png" //提醒背景图片
    private let badgeValueViewImageNameMore = "badge_more@2x.png" //更多背景提醒
    private let badgeValueFont = UIFont.systemFont(ofSize: 12)
    private let badgeValueColor = UIColor.white
    private var badgeValueViewWH:CGFloat{
        get{
//            return CGFloat(itemWH) * 0.15 //如果只是红点提示，则返回此大小
            return CGFloat(itemWH) * 0.45  //如果显示数字，则返回这个大小
        }
    }
    private let KSImageScale:CGFloat = 1
    
    // MARK: - 懒加载红点
    lazy var badgeValueView:UIButton = {
        let x:CGFloat = self.frame.size.width/2+10
        let y:CGFloat = 5
//        let x:CGFloat = self.frame.size.width/2+5
//        let y:CGFloat = 3 只是小红点提示的时候，常量值为这个
        let badgeValueView:UIButton = UIButton.init(frame: CGRect.init(origin: CGPoint.init(x: x, y: y), size: CGSize.init(width: self.badgeValueViewWH, height: self.badgeValueViewWH)))
        badgeValueView.setBackgroundImage(UIImage.init(named: self.badgeValueViewImageName), for: .normal)
        badgeValueView.setTitleColor(self.badgeValueColor, for: UIControlState.normal)
        badgeValueView.adjustsImageWhenHighlighted = false
        badgeValueView.isHidden = true
        badgeValueView.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return badgeValueView
    }()
    
    
    // MARK: - 初始化self
    init(_ frame: CGRect,_ norImage:String,_ selectImage:String,_ titile:String) {
         super.init(frame: frame)
    
        //顶部图片
        self.imageView?.contentMode = .center
        self.setImage(UIImage.init(named: norImage), for: .normal)
        self.setImage(UIImage.init(named: selectImage), for: .selected)
        self.setImage(UIImage.init(named: norImage), for: .highlighted)
    
        //设置文字
        self.titleLabel?.textAlignment = .center
        self.setTitle(titile, for: .normal)
        self.setTitleColor(itemTitleColor, for: .normal)
        self.setTitleColor(itemTitleColor, for: .highlighted)
        self.setTitleColor(selectedItemTitleColor, for: .selected)
        self.titleLabel?.font = itemTitleFont
        self.addSubview(self.badgeValueView)
    
    }
    
    // MARK: - 设置提醒小红点的数量
    func setItemBadgeNumber(_ number:Int){
        if number != 0 {
            if  self.badgeValueView.isHidden == true {
                 self.badgeValueView.isHidden = false
            }
            
            /**
             实现红点及数字提醒
             */
            let tabBadgeNum:String = number > 99 ? "...":"\(number)"
            self.badgeValueView.setTitle(tabBadgeNum, for: .normal)
            let tabBadgeStr:String = "\(number)"
            let longImage:UIImage = UIImage.resizableImage(imageName: badgeValueViewImageName)
            self.badgeValueView.setBackgroundImage(longImage, for: .normal)
            var newframe:CGRect = self.badgeValueView.frame
            if (tabBadgeStr as NSString).length > 1 {
                newframe.size.width = badgeValueViewWH + 4
                self.badgeValueView.frame = newframe
            }else{
                newframe.size.width = badgeValueViewWH
                self.badgeValueView.frame = newframe
            }
            
            /**
             只实现红点提醒，不实现数字提醒
             同上方的方法二者选一
             */
//            self.badgeValueView.setBackgroundImage(UIImage.init(named: "TabBarEdgeImage"), for: .normal)
        }else{
            self.badgeValueView.isHidden = true
        }
    }
    
    //重写系统方法，设置按钮内部图片和文字的位置
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        
        let W:CGFloat = contentRect.size.width
        let H:CGFloat = contentRect.size.height * KSImageScale
        return CGRect.init(x: 0, y: -5, width: W, height: H)
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
       
        let W:CGFloat = contentRect.size.width
        let H:CGFloat = contentRect.size.height * KSImageScale
        let Y:CGFloat = contentRect.size.height - H
        return CGRect.init(x: 0, y: Y+15, width: W, height: H)
    }
    
    //这个是用于Storyboard 的。苹果由于主推SB，所以要求必须实现此方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
