//
//  StatusCell.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import UIKit

final class StatusCell: UITableViewCell {
    
    enum Mode {
        
        case message(String)
        case loading
        
    }
    
    private lazy var indicator = UIActivityIndicatorView()
    private lazy var messageLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        indicator.style = .large
        
        contentView.addSubview(indicator)
        contentView.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            messageLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            messageLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            messageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            messageLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        messageLabel.font = .systemFont(ofSize: 17)
        messageLabel.textColor = .label
        messageLabel.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ mode: Mode) {
        indicator.stopAnimating()
        indicator.alpha = 0
        messageLabel.text = nil
        
        switch mode {
        case .message(let string):
            messageLabel.text = string
        case .loading:
            indicator.startAnimating()
            indicator.alpha = 1
        }
    }
    
}

