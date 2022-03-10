//
//  CountryDetailsViewController.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import UIKit

final class CountryDetailsViewController: BaseViewController<CountrySearchProcess> {
    
    @ImageLoading private var flagImageView
    @ImageLoading private var coatOfArmsImageView
    
    private lazy var imagesStack: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(flagImageView)
        stack.addArrangedSubview(coatOfArmsImageView)
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        
        return stack
    }()
    
    private lazy var summaryStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.spacing = 10
        
        return stack
    }()
    
    private var titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupImages()
        setupTitleLabel()
        setupSummary()
    }
    
    private func setupImages() {
        view.addSubview(imagesStack)
        
        imagesStack.translatesAutoresizingMaskIntoConstraints = false
        flagImageView.contentMode = .scaleAspectFit
        coatOfArmsImageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            imagesStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            imagesStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            imagesStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            imagesStack.heightAnchor.constraint(equalTo: flagImageView.heightAnchor),
            flagImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3, constant: -40),
            flagImageView.heightAnchor.constraint(equalTo: flagImageView.widthAnchor, multiplier: 2/3)
        ])
        
        $flagImageView = process.selectedCountry?.flagImageLink ?? ""
        $coatOfArmsImageView = process.selectedCountry?.coatOfArmsImageLink ?? ""
    }
    
    private func setupTitleLabel() {
        titleLabel.numberOfLines = 2
        titleLabel.font = .systemFont(ofSize: 21, weight: .semibold)
        titleLabel.text = process.selectedCountry?.title
        titleLabel.textColor = .label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: imagesStack.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
    }
    
    private func setupSummary() {
        for element in process.selectedCountry?.summary ?? [] {
            let stack = UIStackView()
            stack.spacing = 5
            stack.distribution = .equalSpacing
            stack.alignment = .leading
            
            let titleLabel = UILabel()
            titleLabel.textColor = .secondaryLabel
            titleLabel.font = .systemFont(ofSize: 15, weight: .semibold)
            titleLabel.text = element.title + ":"
            
            let infoLabel = UILabel()
            infoLabel.textColor = .label
            infoLabel.font = .systemFont(ofSize: 15, weight: .regular)
            infoLabel.text = element.info
            infoLabel.numberOfLines = 0
            
            stack.addArrangedSubview(titleLabel)
            stack.addArrangedSubview(infoLabel)
            
            summaryStack.addArrangedSubview(stack)
        }
        
        summaryStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(summaryStack)
        
        NSLayoutConstraint.activate([
            summaryStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            summaryStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            summaryStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
    
}
