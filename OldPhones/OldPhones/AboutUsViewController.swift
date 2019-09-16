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
//        view.backgroundColor = .red
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
        label.text = "Good as Old Phones returns the phones of  yesteryear back to their original glory and then gets them into the hands* of those who appreciate them most:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secondHalfMainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "TimesNewRomanPSMT", size: 14)
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
        view.backgroundColor = .blue
        return view
    }()
    
    let contactLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setupView() {
        view.addSubview(scrollView)
        setupScrollView()
        setupScrollViewContent()
    }
    
    func setupScrollView() {
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
        topContrainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        topContrainerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        topContrainerView.addSubview(aboutLabel)
//        aboutLabel.backgroundColor = .yellow
        aboutLabel.textAlignment = .center
        aboutLabel.centerXAnchor.constraint(equalTo: topContrainerView.centerXAnchor).isActive = true
        aboutLabel.widthAnchor.constraint(equalTo: topContrainerView.widthAnchor).isActive = true
        aboutLabel.heightAnchor.constraint(equalTo: topContrainerView.heightAnchor, multiplier: 0.3).isActive = true
        
        topContrainerView.addSubview(firstHalfMainLabel)
        firstHalfMainLabel.numberOfLines = 0
//        firstHalfMainLabel.backgroundColor = .green
        firstHalfMainLabel.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor).isActive = true
        firstHalfMainLabel.centerXAnchor.constraint(equalTo: topContrainerView.centerXAnchor).isActive = true
        firstHalfMainLabel.widthAnchor.constraint(equalTo: topContrainerView.widthAnchor, multiplier: 0.6).isActive = true
        firstHalfMainLabel.heightAnchor.constraint(equalTo: topContrainerView.heightAnchor, multiplier: 0.3).isActive = true
        
        topContrainerView.addSubview(secondHalfMainLabel)
        secondHalfMainLabel.numberOfLines = 0
//        secondHalfMainLabel.backgroundColor = .gray
        secondHalfMainLabel.contentMode = .top
        secondHalfMainLabel.topAnchor.constraint(equalTo: firstHalfMainLabel.bottomAnchor).isActive = true
        secondHalfMainLabel.centerXAnchor.constraint(equalTo: topContrainerView.centerXAnchor).isActive = true
        secondHalfMainLabel.widthAnchor.constraint(equalTo: topContrainerView.widthAnchor, multiplier: 0.6).isActive = true
        secondHalfMainLabel.heightAnchor.constraint(equalTo: topContrainerView.heightAnchor, multiplier: 0.3).isActive = true
        
        topContrainerView.addSubview(footerLabel)
//        footerLabel.backgroundColor = .white
        footerLabel.topAnchor.constraint(equalTo: secondHalfMainLabel.bottomAnchor).isActive = true
        footerLabel.centerXAnchor.constraint(equalTo: topContrainerView.centerXAnchor).isActive = true
        footerLabel.widthAnchor.constraint(equalTo: topContrainerView.widthAnchor, multiplier: 0.6).isActive = true
        footerLabel.heightAnchor.constraint(equalTo: topContrainerView.heightAnchor, multiplier: 0.1).isActive = true
//        printFonts()
    }
    
    func printFonts() {
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
        }
    }
    
    func setupBottomContainerView() {
        scrollView.addSubview(bottomContainerView)
        
        bottomContainerView.topAnchor.constraint(equalTo: topContrainerView.bottomAnchor).isActive = true
        bottomContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        bottomContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        bottomContainerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    }
}
