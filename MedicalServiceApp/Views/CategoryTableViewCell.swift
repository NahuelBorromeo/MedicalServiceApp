//
//  CategoryTableViewCell.swift
//  MedicalServiceApp
//
//  Created by Nahuel Borromeo Da costa on 22/07/24.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = CustomLabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .customTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(categoryImageView)
        self.contentView.addSubview(nameLabel)

        
        NSLayoutConstraint.activate([
            categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            categoryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            categoryImageView.widthAnchor.constraint(equalToConstant: 50),
            categoryImageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: Category) {
        categoryImageView.image = UIImage(named: category.iconName)
        nameLabel.text = category.medicalCategory.rawValue
        backgroundColor = .customBackground
    }
}
