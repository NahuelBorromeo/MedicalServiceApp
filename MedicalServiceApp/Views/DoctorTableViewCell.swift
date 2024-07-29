//
//  DoctorTableViewCell.swift
//  MedicalServiceApp
//
//  Created by Nahuel Borromeo Da costa on 22/07/24.
//

import UIKit

class DoctorTableViewCell: UITableViewCell {
    
    private let doctorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = CustomLabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .customTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let specialtyLabel: UILabel = {
        let label = CustomLabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(red: 241.0/255.0, green: 196.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reviewCountLabel: UILabel = {
        let label = CustomLabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = CustomLabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .customTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = CustomLabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contactInfoLabel: UILabel = {
        let label = CustomLabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .customTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scheduleLabel: UILabel = {
        let label = CustomLabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .customTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(doctorImageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(specialtyLabel)
        self.contentView.addSubview(ratingLabel)
        self.contentView.addSubview(reviewCountLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(addressLabel)
        self.contentView.addSubview(contactInfoLabel)
        self.contentView.addSubview(scheduleLabel)
        
        NSLayoutConstraint.activate([
            doctorImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            doctorImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            doctorImageView.widthAnchor.constraint(equalToConstant: 60),
            doctorImageView.heightAnchor.constraint(equalToConstant: 60),
            
            nameLabel.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            specialtyLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            specialtyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            
            ratingLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ratingLabel.topAnchor.constraint(equalTo: specialtyLabel.bottomAnchor, constant: 5),
            
            reviewCountLabel.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 5),
            reviewCountLabel.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: reviewCountLabel.bottomAnchor, constant: 5),
            
            addressLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            addressLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            
            contactInfoLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            contactInfoLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 5),
            
            scheduleLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            scheduleLabel.topAnchor.constraint(equalTo: contactInfoLabel.bottomAnchor, constant: 5),
            scheduleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with doctor: Doctor) {
        doctorImageView.image = UIImage(named: doctor.image)
        nameLabel.text = doctor.name
        specialtyLabel.text = doctor.specialty
        ratingLabel.text = "\(doctor.rating) ★"
        reviewCountLabel.text = "(\(doctor.reviews) Reseñas)"
        addressLabel.text = doctor.address
        backgroundColor = .customBackground
    }
}

