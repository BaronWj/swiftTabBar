//
//  ChatViewController.swift
//  TabBarController
//
//  Created by 潘伟杰 on 16/8/1.
//  Copyright © 2016年 潘伟杰. All rights reserved.
//

import Foundation
import UIKit

@objc(ChatViewController)
class ChatViewController: UIViewController,UIGestureRecognizerDelegate{
    var messageInputView:ChatInputView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.whiteColor();
        self.setupNavigation();
//        
//        self.chatLayout = JChatChattingLayout(messageTable: self.messageTable, inputView: self.messageInputView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    
    func setupNavigation() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.navigationBar.translucent = false
        self.title = "会话"
        let leftBtn = UIButton(type: .Custom)
        leftBtn.frame = kNavigationLeftButtonRect
        leftBtn.setImage(UIImage(named: "goBack"), forState: .Normal)
        leftBtn.imageEdgeInsets = kGoBackBtnImageOffset
        leftBtn.addTarget(self, action: #selector(self.backClick), forControlEvents: .TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        
        let rightBtn = UIButton(type: .Custom)
        rightBtn.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        rightBtn.addTarget(self, action: #selector(self.clickRightBtn), forControlEvents: .TouchUpInside)
        rightBtn.setImage(UIImage(named: "createConversation"), forState: .Normal)
        rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -15 * UIScreen.mainScreen().scale)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
    }
    

    
    
    //发送图片
    func sendImageMessage(image:UIImage){
    
    }
    
    
    func backClick() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func clickRightBtn() {
//        let detailCtl = JCHATGroupDetailViewController()
//        detailCtl.conversation = self.conversation
//        detailCtl.chattingVC = self
//        self.navigationController?.pushViewController(detailCtl, animated: true)
    }
    
}

