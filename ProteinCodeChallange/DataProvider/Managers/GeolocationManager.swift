//
//  GeolocationManager.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 13.06.2023.
//

import Foundation
import MapKit

class GeolocationManager {
    
    static let shared = GeolocationManager()

    func geocode(addressString: String, completion: @escaping (Result<CLLocationCoordinate2D, Error>) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let placemarks = placemarks, let location = placemarks.first?.location else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            completion(.success(location.coordinate))
        }
    }
}
