
//
//  ChatInputView.swift
//  TabBarController
//
//  Created by 潘伟杰 on 16/8/1.
//  Copyright © 2016年 潘伟杰. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol ChatInputViewDelegete:NSObjectProtocol {
    // photo
    func showMoreView()
    func photoClick()
}

class ChatInputView: UIView {
    var inputWrapView : UIView!
    var switchBtn:UIButton!
    var inputTextView :UITextView!
    var recordVoiceBtn : UIButton!
    var showMoreBtn: UIButton!
    var isTextInput: Bool!
    
    var moreView: UIView!
    var showPhotoBtn: UIButton!
    
    weak var inputDelegate:ChatInputViewDelegete!

    
    override init(frame: CGRect){
       super.init(frame: frame)
      self.setupAllViews();
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupAllViews() {
        self.isTextInput = true
        
//        // 更多功能展示
        self.moreView = UIView()
        self.addSubview(self.moreView!)
        self.moreView.backgroundColor = UIColor(netHex: 0xececec)
        
        self.inputWrapView = UIView()
        self.inputWrapView.backgroundColor = UIColor(netHex: 0xdfdfdf)
        self.addSubview(inputWrapView)
        
        moreView?.snp_makeConstraints(closure: { (make) -> Void in
            make.left.right.equalTo(self)
            make.height.equalTo(0)
            make.bottom.equalTo(self.snp_bottom)
            make.top.equalTo(self.inputWrapView.snp_bottom)
        })
        
        self.showPhotoBtn = UIButton()
        self.moreView.addSubview(self.showPhotoBtn)
        self.showPhotoBtn.setImage(UIImage(named: "photo_24"), forState: .Normal)
        self.showPhotoBtn.addTarget(self, action: #selector(ChatInputView.clickShowPhotoBtn), forControlEvents: .TouchUpInside)
        self.showPhotoBtn.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.moreView).offset(10)
            make.left.equalTo(self.moreView).offset(10)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
//        // 输入框的view
        self.inputWrapView.snp_makeConstraints { (make) -> Void in
            make.left.right.top.equalTo(self)
            make.bottom.equalTo(inputWrapView.snp_top)
            make.height.equalTo(35)
        }
//
        // 切换  录音 和 文本输入
        self.switchBtn = UIButton()
        self.switchBtn.setImage(UIImage(named: "voice_toolbar"), forState: .Normal)
        self.switchBtn.setImage(UIImage(named: "keyboard_toolbar"), forState: .Selected)
        
//        self.switchBtn.addTarget(self, action: #selector(JChatInputView.changeInputMode), forControlEvents: .TouchUpInside)
        self.addSubview(self.switchBtn!)
        switchBtn?.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo(inputWrapView).offset(4)
            make.bottom.equalTo(inputWrapView).offset(-4)
            make.size.equalTo(CGSize(width: 27, height: 27))
        })
        
        // 其他功能展示
        self.showMoreBtn = UIButton()
        self.showMoreBtn.setBackgroundImage(UIImage(named: "add01"), forState: .Normal)
        self.showMoreBtn.setBackgroundImage(UIImage(named: "add01_pre"), forState: .Highlighted)
        self.showMoreBtn.addTarget(self, action: #selector(ChatInputView.changeMoreViewStatus), forControlEvents: .TouchUpInside)
        self.addSubview(self.showMoreBtn)
        showMoreBtn?.snp_makeConstraints(closure: { (make) -> Void in
            make.right.equalTo(inputWrapView).offset(-4)
            make.bottom.equalTo(inputWrapView).offset(-4)
            make.size.equalTo(CGSize(width: 27, height: 27))
        })
        
        // 输入宽的大小
//        self.inputTextView = JChatMessageInputView()
        self.inputTextView = UITextView()

        self.inputTextView.layer.borderWidth = 0.5
        self.inputTextView.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.inputTextView.layer.cornerRadius = 2
        self.inputTextView.returnKeyType = .Send
//        self.inputTextView.delegate = self
        self.inputTextView.enablesReturnKeyAutomatically = true
        self.addSubview(self.inputTextView!)
        inputTextView?.snp_makeConstraints(closure: { (make) -> Void in
            make.right.equalTo(self.showMoreBtn.snp_left).offset(-5)
            make.left.equalTo(self.switchBtn.snp_right).offset(5)
            make.top.equalTo(inputWrapView).offset(5)
            make.bottom.equalTo(inputWrapView).offset(-5)
            make.height.greaterThanOrEqualTo(30)
            make.height.lessThanOrEqualTo(100)
        })
        self.updateInputTextViewHeight(self.inputTextView)
        
        // 录音按钮
        self.recordVoiceBtn = UIButton()
        self.addSubview(self.recordVoiceBtn)
        
        self.recordVoiceBtn.backgroundColor = UIColor(netHex: 0x3f80dc)
        self.recordVoiceBtn.hidden = true
        self.recordVoiceBtn.setTitle("按住 说话", forState: .Normal)
        self.recordVoiceBtn.setTitle("松开 结束", forState: .Highlighted)
//        self.recordVoiceBtn.addTarget(self, action: #selector(JChatInputView.holdDownButtonTouchDown), forControlEvents: .TouchDown)
//        self.recordVoiceBtn.addTarget(self, action: #selector(JChatInputView.holdDownButtonTouchUpInside), forControlEvents: .TouchUpInside)
//        self.recordVoiceBtn.addTarget(self, action: #selector(JChatInputView.holdDownButtonTouchUpOutside), forControlEvents: .TouchUpOutside)
//        self.recordVoiceBtn.addTarget(self, action: #selector(JChatInputView.holdDownDragOutside), forControlEvents: .TouchDragExit)
//        self.recordVoiceBtn.addTarget(self, action: #selector(JChatInputView.holdDownDragInside), forControlEvents: .TouchDragEnter)
//        self.recordVoiceBtn.snp_makeConstraints { (make) -> Void in
//            make.right.equalTo(self.showMoreBtn.snp_left).offset(-5)
//            make.left.equalTo(self.switchBtn.snp_right).offset(5)
//            make.top.equalTo(inputWrapView).offset(5).priorityRequired()
//            make.bottom.equalTo(inputWrapView).offset(-5)
//            make.height.equalTo(35).priorityLow()
//        }
        
    }
    
    
    func changeMoreViewStatus() {
        CATransaction.begin()
        hideKeyBoardAnimation()
        self.superview!.layoutIfNeeded()
        self.moreView.snp_updateConstraints { (make) -> Void in
            make.height.equalTo(150)
        }
        UIView.animateWithDuration(keyboardAnimationDuration) { () -> Void in
            
            self.superview!.layoutIfNeeded()
        }
        CATransaction.commit()
    }
    
    func clickShowPhotoBtn() {
        self.inputDelegate.photoClick()
    }
    
    
}

extension ChatInputView:UITextViewDelegate {
    func textViewDidChange(textView: UITextView) {
        self.updateInputTextViewHeight(textView)
    }
    
    func updateInputTextViewHeight(textView: UITextView) {
        let textContentH = textView.contentSize.height
        print("output：\(textContentH)")
        let textHeight = textContentH > 35 ? (textContentH<100 ? textContentH:100):30
        UIView.animateWithDuration(0.2) { () -> Void in
            self.inputTextView.snp_updateConstraints(closure: { (make) -> Void in
                make.height.equalTo(textHeight)
            })
        }
        
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
//            self.inputDelegate.sendTextMessage(self.inputTextView.text)
            self.inputTextView.text = ""
            return false
        }
        return true
    }
}

