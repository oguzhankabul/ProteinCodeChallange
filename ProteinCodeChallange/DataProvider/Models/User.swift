//
//  User.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 12.06.2023.
//

import Foundation

struct User: Decodable {
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob: Dob
    let phone: String
    let cell: String
    let picture: Picture

    struct Name: Decodable {
        let title: String
        let first: String
        let last: String
    }

    struct Location: Decodable {
        let street: Street
        let city: String
        let state: String
        let country: String

        struct Street: Decodable {
            let number: Int
            let name: String
        }
    }

    struct Login: Decodable {
        let uuid: String
        let username: String
    }

    struct Dob: Decodable {
        let date: String
        let age: Int
    }

    struct Picture: Decodable {
        let large: String
        let medium: String
        let thumbnail: String
    }
}

