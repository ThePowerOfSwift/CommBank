//
//  LogOnViewController.swift
//  CommBank
//
//  Created by BIKRAM BHANDARI on 25/4/17.
//  Copyright © 2017 BIKRAM BHANDARI. All rights reserved.
//

import UIKit

class LogOnViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
//        view.backgroundColor = .red;
        setupViews();
    }
    
    func setupViews(){
        view.addSubview(imageView);
        view.addSubview(closeIcon);
        view.addSubview(firstLabel);
        view.addSubview(secondLabel);
        view.addSubview(thirdLabel);
        view.addSubview(fourthLabel);
        
        imageView.setAnchor(top: view.topAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor);
        
        closeIcon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true;
        closeIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true;
        closeIcon.widthAnchor.constraint(equalToConstant: 16).isActive = true;
        closeIcon.heightAnchor.constraint(equalToConstant: 16).isActive = true;
        
        firstLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true;
        firstLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true;
        firstLabel.widthAnchor.constraint(equalToConstant: 52).isActive = true;
        firstLabel.heightAnchor.constraint(equalToConstant: 52).isActive = true;
        firstLabel.delegate = self;
        
        secondLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true;
        secondLabel.leftAnchor.constraint(equalTo: firstLabel.rightAnchor, constant: 16).isActive = true;
        secondLabel.widthAnchor.constraint(equalToConstant: 52).isActive = true;
        secondLabel.heightAnchor.constraint(equalToConstant: 52).isActive = true;
        
        thirdLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true;
        thirdLabel.leftAnchor.constraint(equalTo: secondLabel.rightAnchor, constant: 16).isActive = true;
        thirdLabel.widthAnchor.constraint(equalToConstant: 52).isActive = true;
        thirdLabel.heightAnchor.constraint(equalToConstant: 52).isActive = true;
        
        fourthLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true;
        fourthLabel.leftAnchor.constraint(equalTo: thirdLabel.rightAnchor, constant: 16).isActive = true;
        fourthLabel.widthAnchor.constraint(equalToConstant: 52).isActive = true;
        fourthLabel.heightAnchor.constraint(equalToConstant: 52).isActive = true;
    }
    
    let closeIcon: UIButton = {
        let button = UIButton(type: .system);
        button.setImage(UIImage(named: "close"), for: .normal);
        button.tintColor = UIColor.white;
        button.addTarget(self, action: #selector(handleCloseIconClicked), for: .touchUpInside);
        button.translatesAutoresizingMaskIntoConstraints = false;
        return button;
    }();
    
    let imageView: UIImageView = {
        let iv = UIImageView();
        iv.image = UIImage(named: "background");
        iv.translatesAutoresizingMaskIntoConstraints = false;
        return iv;
    }();
    
    let firstLabel: UITextField = {
        let tv = UITextField();
        tv.layer.borderWidth = 2;
        tv.layer.borderColor = UIColor.white.cgColor;
        tv.layer.backgroundColor = UIColor.lightGray.cgColor;
        tv.layer.cornerRadius = 2;
        tv.translatesAutoresizingMaskIntoConstraints = false;
        tv.font = UIFont.systemFont(ofSize: 20);
        tv.becomeFirstResponder();
        tv.keyboardType = .decimalPad;
        tv.isSecureTextEntry = true;
        tv.keyboardAppearance = UIKeyboardAppearance.dark;
        return tv;
    }();
    
    let secondLabel: UITextField = {
        let tv = UITextField();
        tv.layer.borderWidth = 2;
        tv.layer.borderColor = UIColor.white.cgColor;
        tv.layer.backgroundColor = UIColor.lightGray.cgColor;
        tv.layer.cornerRadius = 2;
        tv.translatesAutoresizingMaskIntoConstraints = false;
        tv.becomeFirstResponder();
        tv.keyboardType = .decimalPad;
        tv.isUserInteractionEnabled = false;
        tv.keyboardAppearance = UIKeyboardAppearance.dark;
        return tv;
    }();
    
    let thirdLabel: UITextView = {
        let tv = UITextView();
        tv.layer.borderWidth = 2;
        tv.layer.borderColor = UIColor.white.cgColor;
        tv.layer.backgroundColor = UIColor.lightGray.cgColor;
        tv.layer.cornerRadius = 2;
        tv.translatesAutoresizingMaskIntoConstraints = false;
        tv.becomeFirstResponder();
        tv.keyboardType = .decimalPad;
        tv.keyboardAppearance = UIKeyboardAppearance.dark;
        return tv;
    }();
    
    let fourthLabel: UITextView = {
        let tv = UITextView();
        tv.layer.borderWidth = 2;
        tv.layer.borderColor = UIColor.white.cgColor;
        tv.layer.backgroundColor = UIColor.lightGray.cgColor;
        tv.layer.cornerRadius = 2;
        tv.translatesAutoresizingMaskIntoConstraints = false;
        tv.becomeFirstResponder();
        tv.keyboardType = .decimalPad;
        tv.keyboardAppearance = UIKeyboardAppearance.dark;
        return tv;
    }();
    
    
    var password: String = "";
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        password = password + string;
        textField.text = textField.text! + "*";
        return false;
    }
    func handleCloseIconClicked(){
        print("Close icon clicked");
        self.present(ViewController(), animated: false, completion: nil);
    }
}
