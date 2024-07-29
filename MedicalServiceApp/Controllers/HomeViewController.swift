//
//  HomeController.swift
//  MedicalServiceApp
//
//  Created by Nahuel Borromeo Da costa on 20/07/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Variables
    
    private var user: User?
    private var categories: [Category] = []
    private var topDoctors: [Doctor] = []
    private var doctors: [Doctor] = []
    
    // MARK: - UI Components
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 130)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collectionView.accessibilityIdentifier = "collectionView"
        collectionView.backgroundColor = .customBackground
        return collectionView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = CustomLabel()
        label.textColor = .customTextColor
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "Cargando..."
        label.numberOfLines = 2
        label.accessibilityIdentifier = "welcomeLabel"
        return label
    }()
    
    private let categoriesLabel: UILabel = {
        let label = CustomLabel()
        label.textColor = .customTextColor
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "Encuentra tu doctor"
        label.accessibilityIdentifier = "categoriesLabel"
        return label
    }()
    
    private let topDoctorsLabel: UILabel = {
        let label = CustomLabel()
        label.textColor = .customTextColor
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "Doctores Destacados"
        label.accessibilityIdentifier = "topDoctorsLabel"
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DoctorTableViewCell.self, forCellReuseIdentifier: "DoctorCell")
        tableView.accessibilityIdentifier = "tableView"
        tableView.backgroundColor = .customBackground
        return tableView
    }()
    
    private let seeAllCategoriesButton = CustomButton(title: "Ver todas >", fontSize: .medium)
    private let seeAllDoctorsButton = CustomButton(title: "Ver todos >", fontSize: .medium)
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchUserData()
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
    
    private func fetchUserData() {
        AuthService.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showFetchingUserErrorAlert(on: self, with: error)
                return
            }
            
            if let user = user {
                self.welcomeLabel.text = "Hola, \(user.username)"
            }
        }
    }
    
    private func fetchDoctorsData() {
        self.categories = FakeDataProvider.getCategories()
        self.doctors = FakeDataProvider.getDoctors()
        self.topDoctors = Array(doctors.sorted(by: { $0.rating > $1.rating }).prefix(5))
        self.collectionView.reloadData()
        self.tableView.reloadData()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        
        self.seeAllCategoriesButton.addTarget(self, action: #selector(didTapSeeAllCategories), for: .touchUpInside)
        self.seeAllDoctorsButton.addTarget(self, action: #selector(didTapSeeAllDoctors), for: .touchUpInside)
        
        self.view.backgroundColor = .customBackground
        
        self.view.addSubview(welcomeLabel)
        self.view.addSubview(categoriesLabel)
        self.view.addSubview(collectionView)
        self.view.addSubview(topDoctorsLabel)
        self.view.addSubview(tableView)
        self.view.addSubview(seeAllCategoriesButton)
        self.view.addSubview(seeAllDoctorsButton)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        categoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        topDoctorsLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        seeAllCategoriesButton.translatesAutoresizingMaskIntoConstraints = false
        seeAllDoctorsButton.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let tabBarHeight = (self.tabBarController?.getTabBarHeight() ?? 0) + 20
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 3),
            
            categoriesLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            categoriesLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            
            seeAllCategoriesButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            seeAllCategoriesButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20), 
                        
            collectionView.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: 270),
            
            topDoctorsLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            topDoctorsLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            
            seeAllDoctorsButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            seeAllDoctorsButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: topDoctorsLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -tabBarHeight)
        ])
    }
    
    // MARK: - Selectors

    @objc private func didTapSeeAllCategories() {
        if let tabBarController = self.tabBarController {
            tabBarController.selectedIndex = 2
        }
    }
    
    @objc private func didTapSeeAllDoctors() {
        if let tabBarController = self.tabBarController {
            tabBarController.selectedIndex = 1
        }
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        let category = categories[indexPath.item]
        cell.configure(with: category)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = categories[indexPath.item]
        let categoryDoctors = doctors.filter { $0.specialty.lowercased().contains(category.medicalCategory.rawValue.lowercased()) }
        let categoryVC = CategoryDetailViewController(category: category, doctors: categoryDoctors)
        self.navigationController?.pushViewController(categoryVC, animated: true)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topDoctors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell", for: indexPath) as! DoctorTableViewCell
        let doctor = topDoctors[indexPath.row]
        cell.configure(with: doctor)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let doctor = topDoctors[indexPath.row]
        let doctorDetailVC = DoctorDetailViewController(doctor: doctor)
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(doctorDetailVC, animated: true)
    }
}

