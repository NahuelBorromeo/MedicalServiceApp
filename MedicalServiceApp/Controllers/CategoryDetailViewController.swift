//
//  CategoryDetailViewController.swift
//  MedicalServiceApp
//
//  Created by Nahuel Borromeo Da costa on 22/07/24.
//

import UIKit

class CategoryDetailViewController: UIViewController {
    
    
    
    // MARK: - Variables

    private let category: Category
    private let doctors: [Doctor]
    
    // MARK: - UI Components

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DoctorTableViewCell.self, forCellReuseIdentifier: "DoctorCell")
        tableView.backgroundColor = .customBackground
        return tableView
    }()
    
    // MARK: - Initialization
    
    init(category: Category, doctors: [Doctor]) {
        self.category = category
        self.doctors = doctors
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        
        self.view.backgroundColor = .customBackground
        self.title = category.medicalCategory.rawValue
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension CategoryDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell", for: indexPath) as! DoctorTableViewCell
        let doctor = doctors[indexPath.row]
        cell.configure(with: doctor)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let doctor = doctors[indexPath.row]
        let doctorDetailVC = DoctorDetailViewController(doctor: doctor)
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.backgroundColor = .customBackground
        self.navigationController?.pushViewController(doctorDetailVC, animated: true)
    }
}

