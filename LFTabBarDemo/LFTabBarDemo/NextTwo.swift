//
//  NextTwo.swift
//  LFTabBarDemo
//
//  Created by 吴林丰 on 2017/3/20.
//  Copyright © 2017年 吴林丰. All rights reserved.
//

import UIKit

class NextTwo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        // Do any additional setup after loading the view.
    }
    
    func createUI( ){
        
        let btn:UIButton = UIButton.init(type: UIButton.ButtonType.custom)
        btn.frame = CGRect.init(x: 50, y: 100, width: 100, height: 100)
        btn.setTitle("点我回首页", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(clickToHome(_:)), for: UIControl.Event.touchUpInside)
        btn.backgroundColor = UIColor.red
        self.view.addSubview(btn)
    }
    
    //点击模拟通过TabBar回首页
    @objc func clickToHome(_ btn:UIButton){
       shareAppdelegate.tabBarController.pushToHome()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
