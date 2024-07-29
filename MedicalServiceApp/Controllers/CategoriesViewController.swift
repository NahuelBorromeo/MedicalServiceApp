//
//  CategoriesViewController.swift
//  MedicalServiceApp
//
//  Created by Nahuel Borromeo Da costa on 21/07/24.
//

import UIKit

class CategoriesViewController: UIViewController {

    // MARK: - Variables
    
    private var categories: [Category] = []
    private var doctors: [Doctor] = []
    
    // MARK: - UI Components
    
    private let categoriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "CategoryCell")
        tableView.rowHeight = 80
        tableView.backgroundColor = .customBackground
        return tableView
    }()
    
    private let categoriesLabel: UILabel = {
        let label = CustomLabel()
        label.textColor = .customTextColor
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Especialidades"
        return label
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        fetchDoctorsData()
        fetchCategoriesData()
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
    }
    
    private func fetchCategoriesData() {
        self.categories = FakeDataProvider.getCategories()
        self.categoriesTableView.reloadData()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        categoriesTableView.dataSource = self
        categoriesTableView.delegate = self
        
        self.view.backgroundColor = .customBackground

        self.view.addSubview(categoriesLabel)
        self.view.addSubview(categoriesTableView)
        
        categoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        categoriesTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let tabBarHeight = (self.tabBarController?.getTabBarHeight() ?? 0) + 20
        
        NSLayoutConstraint.activate([
            categoriesLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            categoriesLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            categoriesTableView.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 10),
            categoriesTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            categoriesTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            categoriesTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -tabBarHeight)
        ])
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryTableViewCell
        let category = categories[indexPath.row]
        cell.configure(with: category)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.item]
        let categoryDoctors = doctors.filter { $0.specialty.lowercased().contains(category.medicalCategory.rawValue.lowercased()) }
        let categoryVC = CategoryDetailViewController(category: category, doctors: categoryDoctors)
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(categoryVC, animated: true)
    }
}
