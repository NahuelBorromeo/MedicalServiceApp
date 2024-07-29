//
//  DoctorDetailViewController.swift
//  MedicalServiceApp
//
//  Created by Nahuel Borromeo Da costa on 22/07/24.
//

import UIKit

class DoctorDetailViewController: UIViewController {
    
    
    // MARK: - Variables
    
    private let doctor: Doctor
    
    // MARK: - UI Components
    
    private let doctorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = CustomLabel()
        label.textColor = .customTextColor
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let specialtyLabel: UILabel = {
        let label = PaddedLabel()
        label.textColor = UIColor(red: 58/255, green: 155/255, blue: 220/255, alpha: 1.0)
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 202/255, green: 232/255, blue: 255/255, alpha: 1.0)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.layer.borderColor = CGColor(red: 202/255, green: 232/255, blue: 255/255, alpha: 1.0)
        label.layer.borderWidth = 1.0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = CustomLabel()
        label.textColor = UIColor(red: 241.0/255.0, green: 196.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = CustomLabel()
        label.textColor = .customTextColor
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let consultationPriceLabel: UILabel = {
        let label = CustomLabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let consultationPriceTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .customTextColor
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Precio de consulta"
        return label
    }()
    
    private let scheduleLabel: UILabel = {
        let label = CustomLabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let scheduleTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .customTextColor
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Horario de Atención"
        return label
    }()
    
    private let biographyLabel: UILabel = {
        let label = CustomLabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .justified
        return label
    }()
    
    private let biographyTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .customTextColor
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Biografía del Doctor"
        return label
    }()
    
    private let titleNavigationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Perfil del Doctor"
        return label
    }()
    
    private let whatsappButton = CustomButton(title: "Contactar por WhatsApp", backgroundColor: .green, fontSize: .big)
    private let callButton = CustomButton(title: "Llamar al Doctor", fontSize: .medium)
    
    // MARK: - Initialization
    
    init(doctor: Doctor) {
        self.doctor = doctor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureData()
        self.whatsappButton.addTarget(self, action: #selector(contactDoctorViaWhatsApp), for: .touchUpInside)
        self.callButton.addTarget(self, action: #selector(callDoctor), for: .touchUpInside)
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        
        self.navigationItem.titleView = titleNavigationLabel
        
        self.view.backgroundColor = .customBackground
        self.title = doctor.name
        
        self.view.addSubview(doctorImageView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(specialtyLabel)
        self.view.addSubview(ratingLabel)
        self.view.addSubview(addressLabel)
        self.view.addSubview(consultationPriceLabel)
        self.view.addSubview(scheduleLabel)
        self.view.addSubview(whatsappButton)
        self.view.addSubview(callButton)
        self.view.addSubview(biographyLabel)
        self.view.addSubview(biographyTitleLabel)
        self.view.addSubview(consultationPriceTitleLabel)
        self.view.addSubview(scheduleTitleLabel)
        
        doctorImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        specialtyLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        consultationPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        scheduleLabel.translatesAutoresizingMaskIntoConstraints = false
        whatsappButton.translatesAutoresizingMaskIntoConstraints = false
        callButton.translatesAutoresizingMaskIntoConstraints = false
        biographyLabel.translatesAutoresizingMaskIntoConstraints = false
        biographyTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        consultationPriceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        scheduleTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let tabBarHeight = (self.tabBarController?.getTabBarHeight() ?? 0) + 20
        
        NSLayoutConstraint.activate([
            doctorImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            doctorImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            doctorImageView.widthAnchor.constraint(equalToConstant: 100),
            doctorImageView.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: doctorImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 20),
            
            ratingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            ratingLabel.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 20),
            ratingLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            addressLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 10),
            addressLabel.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 20),
            addressLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            specialtyLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10),
            specialtyLabel.leadingAnchor.constraint(equalTo: self.doctorImageView.trailingAnchor, constant: 20),
            
            biographyTitleLabel.topAnchor.constraint(equalTo: specialtyLabel.bottomAnchor, constant: 20),
            biographyTitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            biographyTitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            biographyLabel.topAnchor.constraint(equalTo: biographyTitleLabel.bottomAnchor, constant: 10),
            biographyLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            biographyLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),

            consultationPriceTitleLabel.topAnchor.constraint(equalTo: biographyLabel.bottomAnchor, constant: 10),
            consultationPriceTitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            consultationPriceTitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            consultationPriceLabel.topAnchor.constraint(equalTo: consultationPriceTitleLabel.bottomAnchor, constant: 10),
            consultationPriceLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            consultationPriceLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),

            scheduleTitleLabel.topAnchor.constraint(equalTo: consultationPriceLabel.bottomAnchor, constant: 10),
            scheduleTitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            scheduleTitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            
            scheduleLabel.topAnchor.constraint(equalTo: scheduleTitleLabel.bottomAnchor, constant: 10),
            scheduleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            scheduleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            whatsappButton.bottomAnchor.constraint(equalTo: callButton.topAnchor, constant: -20),
            whatsappButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            whatsappButton.heightAnchor.constraint(equalToConstant: 55),
            whatsappButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
           
            callButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -tabBarHeight),
            callButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
       ])
        
        DispatchQueue.main.async {
            self.specialtyLabel.layer.cornerRadius = self.specialtyLabel.frame.size.height / 2
        }
        
        specialtyLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        specialtyLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    
    // MARK: - Configure Data
    
    private func configureData() {
        doctorImageView.image = UIImage(named: doctor.image)
        nameLabel.text = doctor.name
        specialtyLabel.text = doctor.specialty
        ratingLabel.text = "★ \(doctor.rating)(\(doctor.reviews))"
        addressLabel.text = doctor.address
        consultationPriceLabel.text = doctor.consultationPrice
        scheduleLabel.text = doctor.schedule
        biographyLabel.text = doctor.biography
    }
    
    // MARK: - Selectors
    @objc private func contactDoctorViaWhatsApp() {
        let phoneNumber = doctor.contactInfo.replacingOccurrences(of: " ", with: "")
        let urlWhats = "whatsapp://send?phone=\(phoneNumber)"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            // WhatsApp no está instalado
            let alert = UIAlertController(title: "Error", message: "WhatsApp no está instalado en este dispositivo", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc private func callDoctor() {
        let phoneNumber = doctor.contactInfo.replacingOccurrences(of: " ", with: "")
        if let url = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            // Llamadas no permitidas en este dispositivo
            let alert = UIAlertController(title: "Error", message: "Las llamadas no están permitidas en este dispositivo", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
