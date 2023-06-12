//
//  User+Extension.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 12.06.2023.
//

import Foundation
import RealmSwift

extension User {
    func toRealmObject() -> UserObject {
        let userObject = UserObject()
        userObject.name = NameObject(value: ["title": name.title, "first": name.first, "last": name.last])
        userObject.location = LocationObject(value: ["street": ["number": location.street.number, "name": location.street.name], "city": location.city, "state": location.state, "country": location.country])
        userObject.email = email
        userObject.login = LoginObject(value: ["uuid": login.uuid, "username": login.username])
        userObject.dob = DobObject(value: ["date": dob.date, "age": dob.age])
        userObject.phone = phone
        userObject.cell = cell
        userObject.picture = PictureObject(value: ["large": picture.large, "medium": picture.medium, "thumbnail": picture.thumbnail])
        return userObject
    }
}


