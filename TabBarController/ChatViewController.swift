//
//  ChatViewController.swift
//  TabBarController
//
//  Created by 潘伟杰 on 16/8/1.
//  Copyright © 2016年 潘伟杰. All rights reserved.
//

import Foundation
import UIKit
let keyboardAnimationDuration = 0.25


@objc(ChatViewController)
class ChatViewController: UIViewController{
    var messageInputView:ChatInputView!
    var messageTable:JChatMessageTable!
    
    var chatLayout:JChatChattingLayout!


    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.whiteColor();
        self.setupNavigation();
        self.setupAllViews();
        self.addGestureTap();
               
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyboardFrameChange(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)
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
    

    
    func setupAllViews() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.messageInputView = ChatInputView(frame: CGRectZero)
        self.view.addSubview(messageInputView)
//        self.messageInputView.inputDelegate = self
        
        self.messageInputView.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(self.view)
        }
        
        self.messageInputView.moreView.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.view.snp_bottom)
        }
        //init messageTable
        self.messageTable = JChatMessageTable(frame: CGRectZero)
        self.messageTable.separatorStyle = .None
        self.messageTable.backgroundColor = UIColor.redColor()
        
//        self.messageTable.backgroundColor = kTableViewBackgroupColor
//        self.messageTable.delegate = self
//        self.messageTable.dataSource = self
        self.messageTable.keyboardDismissMode = .Interactive
        self.view.addSubview(messageTable)
        self.messageTable.snp_makeConstraints { (make) -> Void in
            make.top.left.right.equalTo(self.view)
            make.bottom.equalTo(self.messageInputView.snp_top)
        }
    }
    

    func addGestureTap(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ChatViewController.handleTap(_:)))
        gesture.delegate = self;
        self.messageTable.addGestureRecognizer(gesture);
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
    
    func keyboardFrameChange(notification:NSNotification){
        let dic = NSDictionary(dictionary: notification.userInfo!)
        let keyboardValue = dic.objectForKey(UIKeyboardFrameEndUserInfoKey) as! NSValue
        let bottomDistance = kApplicationHeight - keyboardValue.CGRectValue().origin.y
        let duration = Double(dic.objectForKey(UIKeyboardAnimationDurationUserInfoKey) as! NSNumber)
        
        UIView.animateWithDuration(duration,animations:{
            self.messageInputView.moreView?.snp_updateConstraints(closure: { (make) in
                make.height.equalTo(bottomDistance)
            })
            self.view.layoutIfNeeded()
        },completion:{
            (value:Bool) in
        })
        
    }
    
}

extension ChatViewController:UIGestureRecognizerDelegate {
    func handleTap(recognizer: UITapGestureRecognizer) {
        hideKeyBoardAnimation()
        UIView.animateWithDuration(keyboardAnimationDuration) { () -> Void in
            self.view.layoutIfNeeded()
            self.messageInputView.moreView.snp_updateConstraints { (make) -> Void in
                make.height.equalTo(0)
            }
            self.view.layoutIfNeeded()
        }
    }
}

func hideKeyBoardAnimation() {
    dispatch_async(dispatch_get_main_queue()) {
        UIApplication.sharedApplication().sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, forEvent: nil)
    }
    UIApplication.sharedApplication().sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, forEvent: nil)
    
}

