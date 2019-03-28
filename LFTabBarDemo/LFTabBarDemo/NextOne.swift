//
//  NextOne.swift
//  LFTabBarDemo
//
//  Created by 吴林丰 on 2017/3/20.
//  Copyright © 2017年 吴林丰. All rights reserved.
//

import UIKit

class NextOne: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createUI( ){
        
        let btn:UIButton = UIButton.init(type: UIButton.ButtonType.custom)
        btn.frame = CGRect.init(x: 100, y: 200, width: 100, height: 100)
        btn.setTitle("点我", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(clickNextPage(_:)), for: UIControl.Event.touchUpInside)
        btn.backgroundColor = UIColor.red
        self.view.addSubview(btn)
    }
    
    @objc func clickNextPage(_ btn:UIButton){
        let newVc:NextTwo = NextTwo.init()
        newVc.navigationItem.title = "这是第二个新页面"
        newVc.view.backgroundColor = UIColor.gray
        self.navigationController?.pushViewController(newVc, animated: true)
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
