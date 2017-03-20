//
//  UIImage+Exe.swift
//  QLKDoctor
//
//  Created by 吴林丰 on 2017/3/9.
//  Copyright © 2017年 吴林丰. All rights reserved.
//

import UIKit

extension UIImage{

    //MARK: - 默认拉伸图片无虚化
    class func resizableImage(imageName:String) -> UIImage{
        let resImage:UIImage = UIImage.init(named: imageName)!
        let w = resImage.size.width * 0.5
        let h = resImage.size.height * 0.5
        let desImage:UIImage = resImage.resizableImage(withCapInsets: .init(top: h, left: w, bottom: h, right: w))
        return desImage
    }
    
    //MARK: - 通过颜色返回图片，用于背景色生成图片
    class func creatImageWithColor(color:UIColor)->UIImage{
        let rect = CGRect.init(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    //MARK: - 生成指定尺寸的纯色图片
    class func imageWithColor(color: UIColor!, size: CGSize) -> UIImage{
        var size = size
        if size.equalTo(CGSize.zero){
            size = CGSize.init(width: 1, height: 1)
        }
        let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    //MARK: - 修改图片尺寸
    class func imageScaleToSize(image: UIImage, size: CGSize) -> UIImage{
        // 创建一个bitmap的context
        // 并把它设置成为当前正在使用的context
        // Determine whether the screen is retina
        if UIScreen.main.scale == 2.0{
            UIGraphicsBeginImageContextWithOptions(size, false, 2.0)
        }else{
            UIGraphicsBeginImageContext(size)
        }
        
        // 绘制改变大小的图片
        image.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        
        // 从当前context中创建一个改变大小后的图片
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // 使当前的context出堆栈
        UIGraphicsEndImageContext()
        
        // 返回新的改变大小后的图片
        return scaledImage!
    }
    
    //MARK: - 压缩图片大小
    class func imageCompress(originalImage: UIImage) -> UIImage{
        guard let imageData = UIImageJPEGRepresentation(originalImage, 0.5) else{
            return originalImage
        }
        
        let compressImage = UIImage(data: imageData)!
        return compressImage
    }
    
    // MARK: -
    /**
     *  切圆形图片
     *
     *  @param image:UIImage
     *  @param inset:CGFloat
     *
     *  @return UIImage
     */
    class func circleImage(image:UIImage,inset:CGFloat) -> UIImage {
        UIGraphicsBeginImageContext(image.size)
        let context:CGContext = UIGraphicsGetCurrentContext()!
        context.setLineWidth(6);
        context.setStrokeColor(UIColor.white.cgColor);
        let rect:CGRect = CGRect.init(x: inset, y: inset, width: (image.size.width-inset*2), height:  (image.size.height-inset*2))
        context.addEllipse(in: rect)
        context.clip()
        image.draw(in: rect)
        context.addEllipse(in: rect)
        context.strokePath()
        let newImg:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImg
    }
    
    // MARK: -
    /**
     *  重设图片大小
     *
     *  @param image:UIImage
     *  @param reSize:CGSize
     *
     *  @return UIImage
     */
    class func reSizeImage(image:UIImage,reSize:CGSize)->UIImage
    {
        UIGraphicsBeginImageContext(reSize)
        image.draw(in: CGRect.init(x: 0, y: 0, width: reSize.width, height: reSize.height))
        let newImg:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImg
    }
    
    // MARK: -
    /**
     *  等比率缩放
     *
     *  @param image:UIImage
     *  @param scaleSize:CGFloat
     *
     *  @return UIImage
     */
    class func scaleImage(image:UIImage,scaleSize:CGFloat)->UIImage
    {
        UIGraphicsBeginImageContext(CGSize.init(width: image.size.width*scaleSize, height: image.size.height*scaleSize))
        image.draw(in: CGRect.init(x: 0, y: 0, width: image.size.width*scaleSize, height: image.size.height*scaleSize))
        let newImg:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImg
    }
    
    // MARK: -
    /**
     *  图片背景色变透明
     *
     */
    class func transparentColor(colorMasking:[CGFloat],image:UIImage) -> UIImage? {
        if let rawImageRef = image.cgImage {
            UIGraphicsBeginImageContext(image.size)
            if let maskedImageRef = rawImageRef.copy(maskingColorComponents: colorMasking) {
                let context: CGContext = UIGraphicsGetCurrentContext()!
                context.translateBy(x: 0.0, y: image.size.height)
                context.scaleBy(x: 1.0, y: -1.0)
                context.draw(maskedImageRef, in: CGRect(x:0, y:0, width:image.size.width,
                                                        height:image.size.height))
                let result = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                return result
            }
        }
        return nil
    }
    
    // MARK: -
    /**
     *  获取alpha透明度的图片
     *  @param alpha 透明度 0-1
     *  @param image
     *
     *  @return image
     */
    class func changeImageWithAlpa(alpa:CGFloat,image:UIImage) ->UIImage {
        UIGraphicsBeginImageContext(image.size)
        image.draw(in: CGRect.init(x: 0, y: 0, width: image.size.width, height: image.size.height))
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: 0, y: -image.size.height)
        context.setBlendMode(CGBlendMode.multiply)
        context.setAlpha(alpa)
        context.draw(image.cgImage!, in: CGRect.init(x: 0, y: 0, width: image.size.width, height: image.size.height))
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
}

