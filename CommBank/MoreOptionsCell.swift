//
//  MoreOptionsCell.swift
//  CommBank
//
//  Created by BIKRAM BHANDARI on 22/4/17.
//  Copyright © 2017 BIKRAM BHANDARI. All rights reserved.
//

import UIKit

class MoreOptionsCell: UICollectionViewCell{
    
    var labelLeftAnchor: NSLayoutConstraint?;

    override init(frame: CGRect) {
        super.init(frame: frame);
//        backgroundColor = UIColor.red;
        setupViews();
    }
    
    override var isHighlighted: Bool{
        didSet{
            backgroundColor = isHighlighted ? UIColor(red: 70/255, green: 66/255, blue: 63/255, alpha: 0.9) : UIColor(red: 59/255, green: 65/255, blue: 65/255, alpha: 1);
        }
    }
    
    var moreOptions : MoreOptions?{
        didSet{
            if let leftIconName = moreOptions?.left_icon_name{
                leftIconView.image = UIImage(named: "\(leftIconName)")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate);
            }
            if let name = moreOptions?.name{
                label.text = name;
            }
            if let rightIconName = moreOptions?.right_icon_name{
                rightIconView.image = UIImage(named: "\(rightIconName)")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate);
            }
        }
    }
    func setupViews(){
        addSubview(searchTextField);
        addSubview(label);
        addSubview(seperatorView);
        addSubview(leftIconView);
        addSubview(rightIconView);
        searchTextField.addSubview(iconView);
        
        
        
        
        iconView.centerXAnchor.constraint(equalTo: searchTextField.centerXAnchor, constant: -26).isActive = true;
        iconView.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor).isActive = true;
        iconView.heightAnchor.constraint(equalToConstant: 12).isActive = true;
        iconView.widthAnchor.constraint(equalToConstant: 12).isActive = true;
        iconView.isHidden = true;
        
        searchTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 5).isActive = true;
        searchTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true;
        searchTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true;
        searchTextField.heightAnchor.constraint(equalToConstant: 26).isActive = true;
        searchTextField.isHidden = true;
        
        seperatorView.setAnchor(top: nil, bottom: self.bottomAnchor, left: searchTextField.leftAnchor, right: self.rightAnchor);
        seperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true;
        seperatorView.isHidden = true;
        
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 5).isActive = true;
        labelLeftAnchor = label.leftAnchor.constraint(equalTo: leftIconView.rightAnchor, constant: 16);
        labelLeftAnchor?.isActive = true;
        label.rightAnchor.constraint(equalTo: rightIconView.leftAnchor).isActive = true;
        label.heightAnchor.constraint(equalToConstant: 26).isActive = true;
        
        leftIconView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true;
        leftIconView.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true;
        leftIconView.widthAnchor.constraint(equalToConstant: 16).isActive = true;
        leftIconView.heightAnchor.constraint(equalToConstant: 16).isActive = true;
        
        rightIconView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true;
        rightIconView.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true;
        rightIconView.widthAnchor.constraint(equalToConstant: 16).isActive = true;
        rightIconView.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    let label: UILabel = {
        let label = UILabel();
        label.text = "Sample text";
        label.textAlignment = .left
        label.textColor = UIColor.white;
//        label.backgroundColor = UIColor.blue;
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    let searchTextField: UITextField = {
        let tf = UITextField();
        tf.placeholder = "Search";
        tf.font = UIFont.systemFont(ofSize: 12);
        tf.layer.cornerRadius = 5;
        tf.textColor = UIColor.gray;
        tf.backgroundColor = UIColor.white;
        tf.translatesAutoresizingMaskIntoConstraints = false;
        tf.textAlignment = .center
        return tf;
    }();
    
    let iconView: UIImageView = {
        let iv = UIImageView();
        iv.tintColor = UIColor.gray;
        iv.image = UIImage(named: "search_icon")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate);
        iv.contentMode = .scaleAspectFill;
        iv.translatesAutoresizingMaskIntoConstraints = false;
        return iv;
    }();
    
    let leftIconView: UIImageView = {
        let iv = UIImageView();
        iv.tintColor = UIColor.white;
//        iv.image = UIImage(named: "my_details")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate);
        iv.contentMode = .scaleAspectFit;
        iv.translatesAutoresizingMaskIntoConstraints = false;
        return iv;
    }();
    
    let rightIconView: UIImageView = {
        let iv = UIImageView();
        iv.tintColor = UIColor.white;
//        iv.image = UIImage(named: "more")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate);
        iv.contentMode = .scaleAspectFit;
        iv.translatesAutoresizingMaskIntoConstraints = false;
        return iv;
    }();
    
    let seperatorView: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = .white;
        return view;
    }();

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
