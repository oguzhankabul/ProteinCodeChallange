//
//  UserDetailViewModel.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 13.06.2023.
//

import Foundation
import CoreLocation

class UserDetailViewModel: BaseViewModel<UserDetailRouter> {
    
    private let user: UserObject
    
    let geocoder = CLGeocoder()
    var locationCoordinate: CLLocationCoordinate2D?
    
    init(router: UserDetailRouter, user: UserObject) {
        self.user = user
        super.init(router: router)
        setLocationCoordinate()
    }
    
    private func setLocationCoordinate() {
        print("locationString :", locationString)
        GeolocationManager.shared.geocode(addressString: locationString) { result in
            switch result {
            case .success(let coordinate):
                self.locationCoordinate = coordinate
            case .failure(let error):
                print("Geocoding error: \(error.localizedDescription)")
            }
        }
    }
    
    var title: String {
        let title = user.name?.title.appending(" ") ?? ""
        let username = user.name?.first.appending(" ") ?? ""
        let last = user.name?.last.appending(" ") ?? ""
        return "\(title) \(username) \(last)"
    }
    
    var largePictureURL: URL? {
        return URL(string: user.picture?.large ?? "")
    }
    
    var locationString: String {
        guard let street = user.location?.street else {
            return ""
        }
        return "\(street.number). \(street.name), \(user.location?.city ?? ""), \(user.location?.state ?? ""), \(user.location?.country ?? "")"
    }
    
    var date: String {
        return formatDateString(date: user.dob?.date)  ?? ""
    }
    
    var age: String {
        return user.dob?.age.toString ?? ""
    }
    
    private func formatDateString(date: String?) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        if let date = dateFormatter.date(from: date ?? "") {
            dateFormatter.dateFormat = "dd MMMM yyyy"
            return dateFormatter.string(from: date)
        }
        return date
    }
} 
