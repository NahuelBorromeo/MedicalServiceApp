//
//  DoctorsViewController.swift
//  MedicalServiceApp
//
//  Created by Nahuel Borromeo Da costa on 21/07/24.
//

import UIKit

class DoctorsViewController: UIViewController {

    // MARK: - Variables
    
    private var doctors: [Doctor] = []
    
    // MARK: - UI Components
    
    private let doctorsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DoctorTableViewCell.self, forCellReuseIdentifier: "DoctorCell")
        tableView.backgroundColor = .customBackground
        return tableView
    }()
    
    private let doctorsLabel: UILabel = {
        let label = CustomLabel()
        label.textColor = .customTextColor
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Doctores"
        return label
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        fetchDoctorsData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Data

    private func fetchDoctorsData() {
        self.doctors = FakeDataProvider.getDoctors()
        self.doctorsTableView.reloadData()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        doctorsTableView.dataSource = self
        doctorsTableView.delegate = self
        
        self.view.backgroundColor = .customBackground

        self.view.addSubview(doctorsLabel)
        self.view.addSubview(doctorsTableView)
        
        doctorsLabel.translatesAutoresizingMaskIntoConstraints = false
        doctorsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let tabBarHeight = (self.tabBarController?.getTabBarHeight() ?? 0) + 20
        
        NSLayoutConstraint.activate([
            doctorsLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            doctorsLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            doctorsTableView.topAnchor.constraint(equalTo: doctorsLabel.bottomAnchor, constant: 10),
            doctorsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            doctorsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            doctorsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -tabBarHeight)
        ])
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension DoctorsViewController: UITableViewDataSource, UITableViewDelegate {
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
        self.navigationController?.pushViewController(doctorDetailVC, animated: true)
    }
}
