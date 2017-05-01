//
//  Page.swift
//  CommBank
//
//  Created by BIKRAM BHANDARI on 14/4/17.
//  Copyright © 2017 BIKRAM BHANDARI. All rights reserved.
//

import UIKit

class PagesView: UICollectionViewCell {
    
    lazy var viewController: ViewController = {
        let vc = ViewController();
        vc.pageView = self;
        return vc;
    }();
    var leftButtonWidthAnchor: NSLayoutConstraint?;
    var leftButtonCenterXAnchor: NSLayoutConstraint?;
    var leftButtonLeftAnchor: NSLayoutConstraint?;

    
    var page: Page? {
        didSet{
            
            let attributedText = NSMutableAttributedString(string: (page?.title)!, attributes:[NSFontAttributeName: UIFont.systemFont(ofSize: 22), NSForegroundColorAttributeName: UIColor.white]);
            attributedText.append(NSAttributedString(string: "\n\n\n\n\((page?.text)!)", attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.white]));
            
            let paragraphStyle = NSMutableParagraphStyle();
            paragraphStyle.alignment = .center;

            
            let characterLength = attributedText.string.characters.count;
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: characterLength));
            
            textView.attributedText = attributedText;
            
            if let imageName = page?.imageName{
                iconView.image = UIImage(named: "\(imageName)")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate);
            }
            
            if let leftButtonText = page?.leftButtonText{
                leftButton.setTitle("\(leftButtonText)", for: .normal);
                
            }
            if let rightButtonText = page?.rightButtonText{
                rightButton.setTitle("\(rightButtonText)", for: .normal);
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clear;
        
        viewController.pageView = self;
        setupViews();
    }
    
    func setupViews(){
        
        addSubview(iconView);
        addSubview(textView);
        addSubview(leftButton);
        addSubview(rightButton);
        
        iconView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true;
        iconView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true;
        iconView.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        iconView.widthAnchor.constraint(equalToConstant: 60).isActive = true;
        
        textView.setAnchor(top: iconView.bottomAnchor, bottom: nil, left: nil, right: nil);
        textView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true;
        textView.widthAnchor.constraint(equalToConstant: 250).isActive = true;
        textView.heightAnchor.constraint(equalToConstant: 200).isActive = true;
        
        leftButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 16).isActive = true;
        leftButtonCenterXAnchor = leftButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        leftButtonCenterXAnchor?.isActive = true;
        leftButtonLeftAnchor = leftButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20);
        leftButton.heightAnchor.constraint(equalToConstant: 36).isActive = true;
        leftButtonWidthAnchor =  leftButton.widthAnchor.constraint(equalToConstant: 120);
        leftButtonWidthAnchor?.isActive = true;
        
        rightButton.leftAnchor.constraint(equalTo: leftButton.rightAnchor, constant: 16).isActive = true;
        rightButton.topAnchor.constraint(equalTo: leftButton.topAnchor).isActive = true;
        rightButton.widthAnchor.constraint(equalToConstant: 140).isActive = true;
        rightButton.heightAnchor.constraint(equalToConstant: 36).isActive = true;
    }
    
    let textView: UITextView = {
        let tv = UITextView();
        tv.backgroundColor = UIColor.clear;
       // tv.textAlignment = .center;
        tv.textColor = UIColor.white;
        tv.translatesAutoresizingMaskIntoConstraints = false;
        tv.text = "Welcome to Australia's number 1 banking app";
        tv.isSelectable = true;
        tv.textContainerInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0);
        tv.isEditable = false;
        return tv;
    }();
    
    let iconView: UIImageView = {
        let iv = UIImageView();
        iv.tintColor = UIColor.white;
        iv.contentMode = .scaleAspectFit;
        iv.translatesAutoresizingMaskIntoConstraints = false;
        return iv;
    }();
    
    lazy var leftButton: UIButton = {
        let button = UIButton(type: .system);
        button.backgroundColor = UIColor(red: 253/255, green: 206/255, blue: 0, alpha: 1);
        button.setTitleColor(UIColor.black, for: .normal);
        button.setTitleColor(UIColor.white, for: UIControlState.highlighted);
        button.addTarget(self, action: #selector(handleLeftButtonClicked), for: .touchDown);
        button.layer.cornerRadius = 18;
        button.translatesAutoresizingMaskIntoConstraints = false;
        return button;
    }();
    
    let rightButton: UIButton = {
        let button = UIButton(type: .system);
        button.setTitleColor(UIColor.black, for: .normal);
        button.backgroundColor = UIColor(red: 253/255, green: 206/255, blue: 0, alpha: 1);
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.layer.cornerRadius = 18;
        return button;
    }();
    
    func handleLeftButtonClicked(){
        if (leftButton.currentTitle == "Log on"){
            viewController.handleLogOn();
        }else if(leftButton.currentTitle == "Turn on simple Balance"){
            print("Turn on simple Balance button clicked");
        }else{
            print("Get cardless cash button clicked");
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
