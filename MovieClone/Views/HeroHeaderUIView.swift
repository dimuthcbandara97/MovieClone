//
//  HeroHeaderUIView.swift
//  MovieClone
//
//  Created by Dimuth Bandara on 2023-02-28.
//

import UIKit

class HeroHeaderUIView: UIView {

    
    private let downloadButton:  UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let heroImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "mymovie")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubViewss()
        applyingContraints()
        
    }
    
    private func addSubViewss(){
        addSubview(playButton)
        addSubview(downloadButton)
    }
    
    private func applyingContraints(){
       
        let playButtonConstraints = [

        playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
        playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
        playButton.widthAnchor.constraint(equalToConstant: 120)
       
        ]
        
        let downloadButtonConstraints = [
        
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
    
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
