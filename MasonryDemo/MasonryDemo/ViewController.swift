//
//  ViewController.swift
//  MasonryDemo
//
//  Created by 杨旗 on 2017/8/11.
//  Copyright © 2017年 杨旗. All rights reserved.
//

import UIKit

//参考网页：http://www.jianshu.com/p/f0524f2193d7

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //添加导航栏
        self.addNaviBar()
        
        //增加子视图
        self.addSubView()
    }

    //MARK:增加导航栏
    private func addNaviBar(){
        let naviView = UIView()
        
        self.view.addSubview(naviView)
        naviView.backgroundColor = UIColor.lightGray
        
        //添加新约束
        naviView.mas_makeConstraints { (maker) in
            maker?.left.mas_equalTo()(0)
            maker?.top.mas_equalTo()(0)
            maker?.right.mas_equalTo()(0)
            maker?.height.mas_equalTo()(64)
        }
        
        //将以前的约束全部删掉，添加新的约束
        naviView.mas_remakeConstraints { (maker) in
            maker?.left.mas_equalTo()(0)
            maker?.bottom.mas_equalTo()(0)
            maker?.right.mas_equalTo()(0)
            maker?.height.mas_equalTo()(64)
        }
        
        //这个方法将覆盖以前的某些特定的约束
        naviView.mas_updateConstraints { (maker) in
            maker?.bottom.mas_equalTo()(-100)
//            maker?.centerY.mas_equalTo()(self.view.mas_centerY)
        }
        
        let label = UILabel()
        label.text = "导航栏文字"
        
        naviView.addSubview(label)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.red
        label.textAlignment = .center
        
        label.mas_makeConstraints { (maker) in
            
            //设置尺寸约束
            maker?.size.mas_equalTo()(CGSize.init(width: 100, height: 44))
            
            //设置x、y
            //写法一：
            maker?.center.mas_equalTo()(naviView.center)

            //写法二：
            //maker?.center.mas_equalTo()(naviView)

            //写法三：
            //maker?.centerX.mas_equalTo()(naviView.mas_centerX)
            //maker?.centerY.mas_equalTo()(naviView.mas_centerY)
            
        }
    }
    
    //MARK:增加子视图
    private func addSubView(){
        /*
            equalTo     : 仅支持基本能数据类型            比较值 Macro
            
            mas_equalTo : 是对equalTo的封装              比较 View     建议用这个
         */
        
        let subView = UIView()
        subView.backgroundColor = UIColor.orange
        
        self.view.addSubview(subView)
        
        subView.mas_makeConstraints { (maker) in
            
            maker?.size.mas_equalTo()(self.view)?.multipliedBy()(0.4)
            
            maker?.top.mas_equalTo()(self.view)?.offset()(20)
            // right 和 bottom 的偏移量 一般都是 负数
            maker?.right.equalTo()(self.view.mas_right)?.offset()(-20)
            
        }
        
        //设置各边距
        let contentLabel = UILabel()
        contentLabel.numberOfLines = 0
        contentLabel.text = "这个是测试文本，不要当真，嘎嘎嘎，小伙子，去哪？"
        contentLabel.textAlignment = .center
        contentLabel.backgroundColor = UIColor.yellow
        
        subView.addSubview(contentLabel)
        
        contentLabel.mas_makeConstraints { (maker) in
            maker?.edges.mas_equalTo()(subView)?.insets()(UIEdgeInsetsMake(10, 10, 10, 10))
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

