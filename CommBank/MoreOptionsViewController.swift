//
//  MoreOptionsViewController.swift
//  CommBank
//
//  Created by BIKRAM BHANDARI on 18/4/17.
//  Copyright © 2017 BIKRAM BHANDARI. All rights reserved.
//

import UIKit

class MoreOptionsViewController: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var viewController: ViewController?;
    let cellId = "cellId"
    var moreOptions = [MoreOptions]();
    
    override init() {
        super.init();
        
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.register(MoreOptionsCell.self, forCellWithReuseIdentifier: cellId);
        
        getData();
    }
    func showMoreOptions(){
        if let window = UIApplication.shared.keyWindow{
            window.addSubview(view);
            
            view.setAnchor(top: window.topAnchor, bottom: window.bottomAnchor, left: window.leftAnchor, right: window.rightAnchor);
            
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOutside)));
            view.alpha = 0.5;
            collectionView.alpha = 1;
            
            window.addSubview(collectionView);
            
            let width = window.frame.width * 0.9;
            
            collectionView.frame = CGRect(x: 0, y: 0, width: 0, height: window.frame.height);
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.collectionView.frame = CGRect(x: 0, y: 0, width: width, height: window.frame.height);
            }, completion: nil)
        }
    }
    
    func handleTapOutside(){
        view.alpha = 0;
        collectionView.alpha = 0;
    }
    
    let view: UIView = {
        let view = UIView();
        view.backgroundColor = UIColor.black;
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }();
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout();
        layout.minimumLineSpacing = 0;
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout);
        cv.showsVerticalScrollIndicator = false;
        cv.backgroundColor = UIColor(red: 59/255, green: 65/255, blue: 65/255, alpha: 0.9);
        cv.translatesAutoresizingMaskIntoConstraints = false;
        return cv;
    }();
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moreOptions.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MoreOptionsCell;
        cell.moreOptions = moreOptions[indexPath.item];
        
        if (indexPath.item == 0){
            cell.label.isHidden = true;
            cell.leftIconView.isHidden = true;
            cell.rightIconView.isHidden = true;
            cell.searchTextField.isHidden = false;
            cell.iconView.isHidden = false;
            cell.seperatorView.isHidden = false;
        }else if (indexPath.item == 9){
            cell.seperatorView.isHidden = false;
            cell.iconView.isHidden = true;
            cell.searchTextField.isHidden = true;
        }else if (indexPath.item == 10){
            cell.labelLeftAnchor?.constant = -16;
            cell.iconView.isHidden = true;
            cell.searchTextField.isHidden = true;
        }else if (indexPath.item == 11){
            cell.seperatorView.isHidden = false;
            cell.labelLeftAnchor?.constant = -16;
            cell.iconView.isHidden = true;
            cell.searchTextField.isHidden = true;
        }else if (indexPath.item == 12){
            cell.labelLeftAnchor?.constant = -16;
            cell.iconView.isHidden = true;
            cell.searchTextField.isHidden = true;
        }else if (indexPath.item == 13){
            cell.labelLeftAnchor?.constant = -16;
            cell.iconView.isHidden = true;
            cell.searchTextField.isHidden = true;
        }else{
            cell.iconView.isHidden = true;
            cell.searchTextField.isHidden = true;
            cell.seperatorView.isHidden = true;
        }
        
        return cell;
    }
    
    func getData(){
        do{
            let file = Bundle.main.url(forResource: "JsonFile", withExtension: "json");
            let data = try Data(contentsOf: file!);
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers);
            
            for data in json as! [[String: Any]]{
                let moreOption = MoreOptions();
                moreOption.setValuesForKeys(data);
                
                moreOptions.append(moreOption)
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData();
                }
            }
        
        }catch let err{
            print(err);
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 76);
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}




