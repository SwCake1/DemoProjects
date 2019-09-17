//
//  AboutUsViewController.swift
//  OldPhones
//
//  Created by pennyworth on 9/10/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    let topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "header-contact")
        return imageView
    }()
    
    let topContrainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let aboutLabel: UILabel = {
        let label = UILabel()
        label.text = "About us"
        label.font = UIFont(name: "DamascusBold", size: 24)!
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstHalfMainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "TimesNewRomanPSMT", size: 14)
        label.textAlignment = .justified
        label.text = "Good as Old Phones returns the phones of  yesteryear back to their original glory and then gets them into the hands* of those who appreciate them most:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secondHalfMainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "TimesNewRomanPSMT", size: 14)
        label.textAlignment = .justified
        label.text = "Whether you are looking for a turn-of-the-century wall set or a Zack Morris Special, we've got you covered. Give us a ring, and we will get you connected. "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let footerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "TimesNewRomanPS-ItalicMT", size: 13)
        label.text = "*Hands-free phones available"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bottomContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contactLabel: UILabel = {
        let label = UILabel()
        label.text = "Contact"
        label.font = UIFont(name: "DamascusBold", size: 24)!
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mailContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mailIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "icon-about-email")
        return imageView
    }()
    
    let mailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "good-as-old@example.com"
        label.font = UIFont(name: "TimesNewRomanPSMT", size: 13)
        return label
    }()
    
    let phoneContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let phoneIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "icon-about-phone")
        return imageView
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "412-888-9028"
        label.font = UIFont(name: "TimesNewRomanPSMT", size: 13)
        return label
    }()
    
    let webContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let websiteIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "icon-about-website")
        return imageView
    }()
    
    let websiteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "www.example.com"
        label.font = UIFont(name: "TimesNewRomanPSMT", size: 13)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        setupScrollView()
        setupScrollViewContent()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height * 1.2)
        scrollView.contentOffset.y = view.frame.height
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.addSubview(topImageView)
    }
    
    func setupScrollViewContent() {
        topImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        topImageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        topImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        topImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        
        setupTopContainerView()
        
        setupBottomContainerView()
    }
    
    func setupTopContainerView() {
        scrollView.addSubview(topContrainerView)
        topContrainerView.topAnchor.constraint(equalTo: topImageView.bottomAnchor).isActive = true
        topContrainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        topContrainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55).isActive = true
        topContrainerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        topContrainerView.addSubview(aboutLabel)
        aboutLabel.textAlignment = .center
        aboutLabel.centerXAnchor.constraint(equalTo: topContrainerView.centerXAnchor).isActive = true
        aboutLabel.widthAnchor.constraint(equalTo: topContrainerView.widthAnchor).isActive = true
        aboutLabel.heightAnchor.constraint(equalTo: topContrainerView.heightAnchor, multiplier: 0.3).isActive = true
        
        topContrainerView.addSubview(firstHalfMainLabel)
        firstHalfMainLabel.numberOfLines = 0
        firstHalfMainLabel.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor).isActive = true
        firstHalfMainLabel.centerXAnchor.constraint(equalTo: topContrainerView.centerXAnchor).isActive = true
        firstHalfMainLabel.widthAnchor.constraint(equalTo: topContrainerView.widthAnchor, multiplier: 0.6).isActive = true
        firstHalfMainLabel.heightAnchor.constraint(equalTo: topContrainerView.heightAnchor, multiplier: 0.3).isActive = true
        
        topContrainerView.addSubview(secondHalfMainLabel)
        secondHalfMainLabel.numberOfLines = 0
        secondHalfMainLabel.contentMode = .top
        secondHalfMainLabel.topAnchor.constraint(equalTo: firstHalfMainLabel.bottomAnchor).isActive = true
        secondHalfMainLabel.centerXAnchor.constraint(equalTo: topContrainerView.centerXAnchor).isActive = true
        secondHalfMainLabel.widthAnchor.constraint(equalTo: topContrainerView.widthAnchor, multiplier: 0.6).isActive = true
        secondHalfMainLabel.heightAnchor.constraint(equalTo: topContrainerView.heightAnchor, multiplier: 0.3).isActive = true
        
        topContrainerView.addSubview(footerLabel)
        footerLabel.topAnchor.constraint(equalTo: secondHalfMainLabel.bottomAnchor).isActive = true
        footerLabel.centerXAnchor.constraint(equalTo: topContrainerView.centerXAnchor).isActive = true
        footerLabel.widthAnchor.constraint(equalTo: topContrainerView.widthAnchor, multiplier: 0.6).isActive = true
        footerLabel.heightAnchor.constraint(equalTo: topContrainerView.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    func setupBottomContainerView() {
        scrollView.addSubview(bottomContainerView)
        
        bottomContainerView.topAnchor.constraint(equalTo: topContrainerView.bottomAnchor).isActive = true
        bottomContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        bottomContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        bottomContainerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        bottomContainerView.addSubview(contactLabel)
        contactLabel.textAlignment = .center
        contactLabel.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor).isActive = true
        contactLabel.topAnchor.constraint(equalTo: bottomContainerView.topAnchor).isActive = true
        contactLabel.widthAnchor.constraint(equalTo: bottomContainerView.widthAnchor).isActive = true
        contactLabel.heightAnchor.constraint(equalTo: bottomContainerView.heightAnchor, multiplier: 0.25).isActive = true
        
        setupMailContainer()
        
        setupPhoneContainer()
        
        setupWebContainer()
        
    }
    
    func setupMailContainer(){
        bottomContainerView.addSubview(mailContainerView)
        mailContainerView.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor).isActive = true
        mailContainerView.widthAnchor.constraint(equalTo: bottomContainerView.widthAnchor, multiplier: 0.6).isActive = true
        mailContainerView.heightAnchor.constraint(equalTo: bottomContainerView.heightAnchor, multiplier: 0.25).isActive = true
        mailContainerView.topAnchor.constraint(equalTo: contactLabel.bottomAnchor).isActive = true
        
        mailContainerView.addSubview(mailIcon)
        mailIcon.centerYAnchor.constraint(equalTo: mailContainerView.centerYAnchor).isActive = true
        mailIcon.leadingAnchor.constraint(equalTo: mailContainerView.leadingAnchor).isActive = true
        
        mailContainerView.addSubview(mailLabel)
        mailLabel.textAlignment = .center
        mailLabel.centerYAnchor.constraint(equalTo: mailContainerView.centerYAnchor).isActive = true
        mailLabel.leadingAnchor.constraint(equalTo: mailIcon.trailingAnchor).isActive = true
        mailLabel.trailingAnchor.constraint(equalTo: mailContainerView.trailingAnchor).isActive = true
    }
    
    func setupPhoneContainer(){
        bottomContainerView.addSubview(phoneContainerView)
        phoneContainerView.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor).isActive = true
        phoneContainerView.widthAnchor.constraint(equalTo: bottomContainerView.widthAnchor, multiplier: 0.6).isActive = true
        phoneContainerView.heightAnchor.constraint(equalTo: bottomContainerView.heightAnchor, multiplier: 0.25).isActive = true
        phoneContainerView.topAnchor.constraint(equalTo: mailContainerView.bottomAnchor).isActive = true
        
        phoneContainerView.addSubview(phoneIcon)
        phoneIcon.centerYAnchor.constraint(equalTo: phoneContainerView.centerYAnchor).isActive = true
        phoneIcon.leadingAnchor.constraint(equalTo: phoneContainerView.leadingAnchor).isActive = true
        
        phoneContainerView.addSubview(phoneLabel)
        phoneLabel.textAlignment = .center
        phoneLabel.centerYAnchor.constraint(equalTo: phoneContainerView.centerYAnchor).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor).isActive = true
        phoneLabel.trailingAnchor.constraint(equalTo: phoneContainerView.trailingAnchor).isActive = true
    }
    
    func setupWebContainer(){
        bottomContainerView.addSubview(webContainerView)
        webContainerView.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor).isActive = true
        webContainerView.widthAnchor.constraint(equalTo: bottomContainerView.widthAnchor, multiplier: 0.6).isActive = true
        webContainerView.heightAnchor.constraint(equalTo: bottomContainerView.heightAnchor, multiplier: 0.25).isActive = true
        webContainerView.topAnchor.constraint(equalTo: phoneContainerView.bottomAnchor).isActive = true
        
        webContainerView.addSubview(websiteIcon)
        websiteIcon.centerYAnchor.constraint(equalTo: webContainerView.centerYAnchor).isActive = true
        websiteIcon.leadingAnchor.constraint(equalTo: webContainerView.leadingAnchor).isActive = true
        
        webContainerView.addSubview(websiteLabel)
        websiteLabel.textAlignment = .center
        websiteLabel.centerYAnchor.constraint(equalTo: webContainerView.centerYAnchor).isActive = true
        websiteLabel.leadingAnchor.constraint(equalTo: websiteIcon.trailingAnchor).isActive = true
        websiteLabel.trailingAnchor.constraint(equalTo: webContainerView.trailingAnchor).isActive = true
    }
}
