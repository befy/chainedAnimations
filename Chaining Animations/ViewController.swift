//
//  ViewController.swift
//  Chaining Animations
//
//  Created by Alper Tabak on 6.04.2018.
//  Copyright © 2018 alper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	let titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "SAVATAGE"
		label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
		label.sizeToFit()
		return label
	}()
	let contentLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Savatage  is an American heavy metal band founded by the Oliva brothers Jon and Criss in 1979 at Astro Skate in Tarpon Springs, Florida. The band was first called Avatar, and changed their name to Savatage just prior to the release of their debut album Sirens (1983)."
		label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
		label.numberOfLines = 0
		return label
	}()
	override func viewDidLoad() {
		super.viewDidLoad()
		setupSettings()
		setupUI()
	}
	
	@objc func animateLabels(){
		UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
			
			self.titleLabel.transform = CGAffineTransform(translationX: -self.titleLabel.frame.width - 8, y: 0)
			
		}) { (_) in
			UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
				
				self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
				self.titleLabel.alpha = 0
				
			}) { (_) in
			}
		}
		UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
			self.contentLabel.transform = CGAffineTransform(translationX: 0, y: self.view.frame.maxY)
			self.contentLabel.alpha = 0
		})
		
	}
	
	fileprivate func setupSettings(){
		view.backgroundColor = .white
		[titleLabel,contentLabel].forEach({view.addSubview($0)})
		view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateLabels)))
	}
	
	fileprivate func setupUI(){
		titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
		titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
		contentLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
		contentLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
	}
}

