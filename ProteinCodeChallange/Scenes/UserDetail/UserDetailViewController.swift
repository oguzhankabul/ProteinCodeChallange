//
//  UserDetailViewController.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 13.06.2023.
//

import UIKit
import MapKit

class UserDetailViewController: BaseViewController<UserDetailViewModel> {
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    private let dobLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.title
        bindViewModel()
    }
    
    override func setupViews() {
        super.setupViews()
        
        [userImageView, mapView, stackView].forEach({ view.addSubview($0)})
        [dobLabel, ageLabel].forEach({ stackView.addArrangedSubview($0) })
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            userImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImageView.widthAnchor.constraint(equalToConstant: 150),
            userImageView.heightAnchor.constraint(equalToConstant: 150),
            
            mapView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10),
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mapView.heightAnchor.constraint(equalToConstant: 200),
            
            stackView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 10),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func bindViewModel() {
        if let url = viewModel.largePictureURL {
            userImageView.load(url: url, placeholder: "placeholderImageName")
        }
        dobLabel.text = viewModel.date
        ageLabel.text = viewModel.age
        if let coordinate = viewModel.locationCoordinate {
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
            mapView.setRegion(region, animated: true)
        }
    }
}
