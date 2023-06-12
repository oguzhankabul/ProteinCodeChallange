//
//  UserCell.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 13.06.2023.
//

import UIKit

class UserCell: UITableViewCell {
    
    var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        addSubview(userImageView)
        addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
            userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            userImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            userImageView.heightAnchor.constraint(equalToConstant: 24),
            userImageView.widthAnchor.constraint(equalToConstant: 24),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            userNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func configure(with user: UserObject) {
        if let url = URL(string: user.picture?.thumbnail ?? "") {
            userImageView.load(url: url, placeholder: "placeholderImageName")
        }
        let title = user.name?.title.appending(" ") ?? ""
        let first = user.name?.first.appending(" ") ?? ""
        let last = user.name?.last.appending(" ") ?? ""
        userNameLabel.text = title + first + last
    }
}

