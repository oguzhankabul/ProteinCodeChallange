//
//  UserObject.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 12.06.2023.
//

import Foundation
import RealmSwift

class UserObject: Object {
    @objc dynamic var name: NameObject?
    @objc dynamic var location: LocationObject?
    @objc dynamic var email = ""
    @objc dynamic var login: LoginObject?
    @objc dynamic var dob: DobObject?
    @objc dynamic var phone = ""
    @objc dynamic var cell = ""
    @objc dynamic var picture: PictureObject?
    
    override static func primaryKey() -> String? {
        return "email"
    }
}

class NameObject: EmbeddedObject {
    @objc dynamic var title = ""
    @objc dynamic var first = ""
    @objc dynamic var last = ""
}

class LocationObject: EmbeddedObject {
    @objc dynamic var street: StreetObject?
    @objc dynamic var city = ""
    @objc dynamic var state = ""
    @objc dynamic var country = ""
}

class StreetObject: EmbeddedObject {
    @objc dynamic var number = 0
    @objc dynamic var name = ""
}

class LoginObject: EmbeddedObject {
    @objc dynamic var uuid = ""
    @objc dynamic var username = ""
}

class DobObject: EmbeddedObject {
    @objc dynamic var date = ""
    @objc dynamic var age = 0
}

class PictureObject: EmbeddedObject {
    @objc dynamic var large = ""
    @objc dynamic var medium = ""
    @objc dynamic var thumbnail = ""
}

