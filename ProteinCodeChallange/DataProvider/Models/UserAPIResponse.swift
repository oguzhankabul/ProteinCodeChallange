//
//  UserAPIResponse.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 12.06.2023.
//

import Foundation

struct UserAPIResponse: Decodable {
    let results: [User]
}
