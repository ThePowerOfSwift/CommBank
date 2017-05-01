//
//  ViewController.swift
//  CommBank
//
//  Created by BIKRAM BHANDARI on 27/3/17.
//  Copyright © 2017 BIKRAM BHANDARI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId = "CellId";
    var pageView: PagesView?;
    
    lazy var moreOptionsViewController: MoreOptionsViewController = {
        let moreOPtions = MoreOptionsViewController();
        moreOPtions.viewController = self;
        return moreOPtions;
    }();
    
    lazy var pagesView: PagesView = {
        let page = PagesView();
        page.viewController = self;
        return page;
    }();
    
    let pages: [Page] = {
        let page1 = Page(title: "Welcome to Nepal's number one banking app", text: "with over 4 million users", imageName: nil, leftButtonText: "Log on", rightButtonText: nil);
        let page2 = Page(title: "Simple Balance", text: "Simple balance gives you a quick \n view of your account with just \n a swipe of  your finger.", imageName: "dollar", leftButtonText: "Turn on simple Balance", rightButtonText: nil);
        let page3 = Page(title: "Nearest ATM", text: "47-49 Carlton Pde, Carlton \n718m away", imageName: "location", leftButtonText: "Get Cardless Cash", rightButtonText: "Search");
        
        return [page1, page2, page3];
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        setupViews();
        
        collectionView.register(PagesView.self, forCellWithReuseIdentifier: cellId);

    }
    
    
    func setupViews(){
        
        view.addSubview(backgroundImageView);
        
        backgroundImageView.setAnchor(top: self.view.topAnchor, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor);
        
        view.addSubview(titleBar);
        view.addSubview(collectionView);
        view.addSubview(pageControl);
        view.addSubview(buttonsContainerView);
        
        titleBar.setAnchor(top: view.topAnchor, bottom: collectionView.topAnchor, left: view.leftAnchor, right: view.rightAnchor);
        titleBar.heightAnchor.constraint(equalToConstant: 100).isActive = true;
        
        titleBar.addSubview(hamburgerButton);
        titleBar.addSubview(titleImageView);
        titleBar.addSubview(searchButton);
        
        hamburgerButton.setAnchorsWithConstant(top: nil, topConstant: 0, bottom: nil, bottomConstant: 0, left: titleBar.leftAnchor, leftConstant: 8, right: nil, rightConstant: 0);
        hamburgerButton.centerYAnchor.constraint(equalTo: titleBar.centerYAnchor).isActive = true;
        hamburgerButton.widthAnchor.constraint(equalToConstant: 30).isActive = true;
        hamburgerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true;
        
        
        titleImageView.setAnchor(top: nil, bottom: nil, left: hamburgerButton.rightAnchor, right: searchButton.leftAnchor);
        titleImageView.centerYAnchor.constraint(equalTo: titleBar.centerYAnchor).isActive = true;
        titleImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true;
        
        searchButton.setAnchorsWithConstant(top: titleImageView.topAnchor, topConstant: 0, bottom: nil, bottomConstant: 0, left: nil, leftConstant: 0, right: titleBar.rightAnchor, rightConstant: 8);
        searchButton.widthAnchor.constraint(equalToConstant: 30).isActive = true;
        searchButton.heightAnchor.constraint(equalToConstant: 30).isActive = true;
        
        collectionView.setAnchor(top: titleBar.bottomAnchor, bottom: pageControl.topAnchor, left: view.leftAnchor, right: view.rightAnchor);
        
        pageControl.setAnchor(top: nil, bottom: buttonsContainerView.topAnchor, left: view.leftAnchor, right: view.rightAnchor);
        pageControl.heightAnchor.constraint(equalToConstant: 30).isActive = true;
        
        buttonsContainerView.addSubview(horizontalSeperatorView);
        buttonsContainerView.addSubview(verticalSeperatorView1);
        buttonsContainerView.addSubview(verticalSeperatorView2);
        
        buttonsContainerView.setAnchor(top: nil, bottom: view.bottomAnchor, left: view.leftAnchor, right: nil);
        buttonsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true;
        buttonsContainerView.heightAnchor.constraint(equalToConstant: 200).isActive = true;
        
        setupAnchorsOfImageAndLabel(buttonView: transferButtonView, imageView: transferImageView, textLabel: transferTextLabel, iconName: "transfer", textLabelName: "Transfer between \nyour accounts", top: buttonsContainerView.topAnchor, bottom: nil, left: buttonsContainerView.leftAnchor, right: nil);
        
        verticalSeperatorView1.setAnchor(top: buttonsContainerView.topAnchor, bottom: buttonsContainerView.bottomAnchor, left: transferButtonView.rightAnchor, right: nil);
        verticalSeperatorView1.widthAnchor.constraint(equalToConstant: 1).isActive = true;
        
        setupAnchorsOfImageAndLabel(buttonView: paySomeoneButtonView, imageView: paySomeoneImageView, textLabel: paySomeoneTextLabel, iconName: "pay_someone", textLabelName: "Pay someone", top: buttonsContainerView.topAnchor, bottom: nil, left: verticalSeperatorView1.rightAnchor, right: nil);
        
        verticalSeperatorView2.setAnchor(top: buttonsContainerView.topAnchor, bottom: buttonsContainerView.bottomAnchor, left: paySomeoneButtonView.rightAnchor, right: nil);
        verticalSeperatorView2.widthAnchor.constraint(equalToConstant: 1).isActive = true;
        
        setupAnchorsOfImageAndLabel(buttonView: bPayButtonView, imageView: bPayImageView, textLabel: bPayTextLabel, iconName: "b_pay", textLabelName: "BPAY", top: buttonsContainerView.topAnchor, bottom: nil, left: verticalSeperatorView2.rightAnchor, right: nil);
        
        horizontalSeperatorView.setAnchor(top: transferButtonView.bottomAnchor, bottom: nil, left: buttonsContainerView.leftAnchor, right: buttonsContainerView.rightAnchor);
        horizontalSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true;
        
        
        
        setupAnchorsOfImageAndLabel(buttonView: viewAccountsButtonView, imageView: viewAccountsImageView, textLabel: viewAccountsTextLabel, iconName: "view_accounts", textLabelName: "View accounts", top: horizontalSeperatorView.bottomAnchor, bottom: nil, left: buttonsContainerView.leftAnchor, right: nil);
        
        setupAnchorsOfImageAndLabel(buttonView: cardsButtonView, imageView: cardsImageView, textLabel: cardsTextLabel, iconName: "cards", textLabelName: "Cards", top: horizontalSeperatorView.bottomAnchor, bottom: nil, left: verticalSeperatorView1.rightAnchor, right: nil);
        
        setupAnchorsOfImageAndLabel(buttonView: productsAndOffersButtonView, imageView: productsAndOffersImageView, textLabel: productsAndOffersTextLabel, iconName: "products_offers", textLabelName: "Products and offers", top: horizontalSeperatorView.bottomAnchor, bottom: nil, left: verticalSeperatorView2.rightAnchor, right: nil);
        
    
    }
    
    func setupAnchorsOfImageAndLabel(buttonView: UIView, imageView: UIImageView, textLabel: UILabel, iconName: String, textLabelName: String, top: NSLayoutYAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil){
        buttonsContainerView.addSubview(buttonView);
        setupTextLabelAndIcon(view: buttonView,imageView: imageView, textLabel: textLabel, iconName: iconName, textLabelName: textLabelName);
        buttonView.setAnchor(top: top, bottom: bottom, left: left, right: right);
        buttonView.heightAnchor.constraint(equalToConstant: 100).isActive = true;
        buttonView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3, constant: -2/3).isActive = true;
    }
    
    func addGradient(view: UIView){
        let gradient: CAGradientLayer = CAGradientLayer();
        gradient.frame = CGRect(x: 0, y: 0, width:self.view.frame.width, height: 200);
        let topColor = UIColor(red: 21/255, green: 67/255, blue: 96/255, alpha: 1.0).cgColor;
        let bottomColor = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1.0).cgColor;
        gradient.colors = [topColor, bottomColor];
        view.layer.addSublayer(gradient);
    }
    
    func setupTextLabelAndIcon(view : UIView, imageView: UIImageView, textLabel: UILabel, iconName: String, textLabelName: String){
        
        view.addSubview(imageView);
        view.addSubview(textLabel);
        view.backgroundColor = UIColor(red: 88/255, green: 88/255, blue: 76/255, alpha: 0.9);
        
        imageView.image = UIImage(named: iconName)?.withRenderingMode(UIImageRenderingMode.alwaysTemplate);
        imageView.isOpaque = true
        imageView.tintColor = UIColor(red: 253/255, green: 206/255, blue: 0, alpha: 1);
        textLabel.text = textLabelName;
        textLabel.textAlignment = .center;
        textLabel.font = UIFont.boldSystemFont(ofSize: 10);
        

        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        imageView.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true;
        //imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true;
        imageView.heightAnchor.constraint(equalToConstant: 28).isActive = true;
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true;
        
        textLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true;
        textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -8).isActive = true;
        textLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        textLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true;
    }
    
    let backgroundImageView: UIView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "background");
        iv.contentMode = .scaleAspectFill;
        iv.translatesAutoresizingMaskIntoConstraints = false;
        return iv;
    }();
    
    let buttonsContainerView: UIView = {
        let view = UIView();
//        view.backgroundColor = UIColor(red: 88/255, green: 88/255, blue: 76/255, alpha: 0.9);
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }();
    
    let horizontalSeperatorView: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = UIColor.white;
        return view;
    }();
    
    let verticalSeperatorView1: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = UIColor.white;
        return view;
    }();
    
    let verticalSeperatorView2: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = UIColor.white;
        return view;
    }();
    
    let transferButtonView: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }();
    
    let transferImageView : UIImageView = {
        let iv = UIImageView();
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false;
        return iv;
    }();
    
    let transferTextLabel: UILabel = {
        let label = UILabel();
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.font = UIFont.systemFont(ofSize: 12);
        label.textColor = UIColor.white;
        label.numberOfLines = 2
        return label;
    }();
    
    let paySomeoneButtonView: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }();
    
    let paySomeoneImageView : UIImageView = {
        let iv = UIImageView();
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false;
        return iv;
    }();
    
    let paySomeoneTextLabel: UILabel = {
        let label = UILabel();
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.font = UIFont.systemFont(ofSize: 12);
        label.textColor = UIColor.white;
        return label;
    }();
    
    let bPayButtonView: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }();
    
    let bPayImageView : UIImageView = {
        let iv = UIImageView();
        iv.tintColor = UIColor.yellow;
        iv.translatesAutoresizingMaskIntoConstraints = false;
        return iv;
    }();
    
    let bPayTextLabel: UILabel = {
        let label = UILabel();
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.font = UIFont.systemFont(ofSize: 12);
        label.textColor = UIColor.white;
        return label;
    }();
    
    let viewAccountsButtonView: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }();
    
    let viewAccountsImageView : UIImageView = {
        let iv = UIImageView();
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false;
        return iv;
    }();
    
    let viewAccountsTextLabel: UILabel = {
        let label = UILabel();
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.font = UIFont.systemFont(ofSize: 12);
        label.textColor = UIColor.white;
        return label;
    }();
    
    let cardsButtonView: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }();
    
    let cardsImageView : UIImageView = {
        let iv = UIImageView();
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false;
        return iv;
    }();
    
    let cardsTextLabel: UILabel = {
        let label = UILabel();
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.font = UIFont.systemFont(ofSize: 12);
        label.textColor = UIColor.white;
        return label;
    }();
    
    let productsAndOffersButtonView: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }();
    
    let productsAndOffersImageView : UIImageView = {
        let iv = UIImageView();
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false;
        return iv;
    }();
    
    let productsAndOffersTextLabel: UILabel = {
        let label = UILabel();
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.font = UIFont.systemFont(ofSize: 12);
        label.textColor = UIColor.white;
        return label;
    }();
    
    let titleBar: UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }();
    
    let hamburgerButton: UIButton = {
        let button = UIButton(type: .system);
        button.setImage(UIImage(named:"hamburger_icon"), for: .normal);
        button.tintColor = UIColor.white;
        button.addTarget(self, action: #selector(handleMoreOptions), for: UIControlEvents.touchUpInside);
        return button;
    }();
    
    func handleMoreOptions(){
        moreOptionsViewController.showMoreOptions();
//        print("More button clicked");
    }
    
    let titleImageView : UIImageView = {
        let iv = UIImageView();
        iv.image = UIImage(named: "commonwealth_Bank");
        iv.contentMode = .scaleAspectFit;
        iv.translatesAutoresizingMaskIntoConstraints = false;
        return iv;
    }();
    
    let searchButton: UIButton = {
        let button = UIButton(type: .system);
        button.setImage(UIImage(named: "search_icon"), for: .normal);
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.contentMode = .scaleAspectFit;
        button.tintColor = UIColor.white;
        return button;
    }();
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl();
        pc.pageIndicatorTintColor = UIColor.black;
        pc.currentPageIndicatorTintColor = UIColor.white;
        pc.numberOfPages = self.pages.count;
        pc.translatesAutoresizingMaskIntoConstraints = false;
        pc.addTarget(self, action: #selector(handlePageClick), for: .touchUpInside);
        return pc;
    }();
    
    func addGradientForPageControl(view: UIView){
        let gradient: CAGradientLayer = CAGradientLayer();
        gradient.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height);
        let topColor = UIColor(red: 151/255, green: 165/255, blue: 150/255, alpha: 0.04).cgColor;
        let bottomColor = UIColor(red: 79/255, green: 129/255, blue: 120/255, alpha: 0.5).cgColor;
        gradient.colors = [topColor, bottomColor];
        view.backgroundColor = UIColor.clear;
        view.layer.addSublayer(gradient);
    }
    
    func handlePageClick(){
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0);
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true);
    }
    
    lazy var collectionView: UICollectionView = {
        let layout  = UICollectionViewFlowLayout();
        layout.minimumLineSpacing = 0;
        layout.scrollDirection = .horizontal;
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout);
        cv.showsHorizontalScrollIndicator = false;
        cv.delegate = self;
        cv.dataSource = self;
        cv.isPagingEnabled = true;
        cv.backgroundColor = UIColor.clear;
        return cv
    }();

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PagesView;
        if indexPath.item == 1{
            cell.leftButtonWidthAnchor?.constant = 200;
            cell.leftButtonLeftAnchor?.isActive = false;
            cell.rightButton.isHidden = true;
        }else if indexPath.item == 2{
            cell.rightButton.isEnabled = true;
            cell.leftButtonWidthAnchor?.constant = 210;
            cell.leftButtonCenterXAnchor?.isActive = false;
            cell.leftButtonLeftAnchor?.isActive = true;
            cell.leftButton.backgroundColor = UIColor.clear;
            cell.leftButton.layer.borderColor = UIColor.white.cgColor;
            cell.leftButton.layer.borderWidth = 1;
            cell.leftButton.setTitleColor(UIColor.white, for: .normal);
        }else{
            cell.rightButton.isHidden = true;
            cell.leftButtonLeftAnchor?.isActive = false;
        }
        cell.page = pages[indexPath.item];
        return cell
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 330)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = targetContentOffset.pointee.x / view.frame.width;
        pageControl.currentPage = Int(pageNumber);
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout();
        
    }
    
    var window: UIWindow?;
    
    func handleLogOn(){
        window = UIWindow(frame: UIScreen.main.bounds);
        window?.makeKeyAndVisible();
        
        window?.rootViewController = LogOnViewController();
    }
}

extension UIView{
    func setAnchor(top: NSLayoutYAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil){
        setAnchorsWithConstant(top: top, topConstant: 0, bottom: bottom, bottomConstant: 0, left: left, leftConstant: 0, right: right, rightConstant: 0);
    }
    
    func setAnchorsWithConstant(top: NSLayoutYAxisAnchor? = nil, topConstant: CGFloat = 0, bottom: NSLayoutYAxisAnchor? = nil, bottomConstant: CGFloat = 0, left: NSLayoutXAxisAnchor? = nil, leftConstant: CGFloat = 0, right: NSLayoutXAxisAnchor? = nil, rightConstant: CGFloat = 0){
        
        translatesAutoresizingMaskIntoConstraints = false;
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true;
        }
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true;
        }
        
        if let left = left{
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true;
        }
        
        if let right = right{
            rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true;
        }
    }
}

