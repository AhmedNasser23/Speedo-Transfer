//
//  UserDefaultsManager.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 12/09/2024.
//

import Foundation

class UserDefaultsManager {
    
    // MARK: - Singelton
    static private let sharedInstance = UserDefaultsManager()
    private init() {}
    
    static func shared() -> UserDefaultsManager {
        return sharedInstance
    }
    
    // MARK: - Properties
    private let def = UserDefaults.standard
    
    var isLoggedin: Bool? {
        set {
            def.setValue(newValue, forKey: "isLoggedin")
        }
        get {
            if def.object(forKey: "isLoggedin") == nil {
                return nil
            }
            return def.bool(forKey: "isLoggedin")
        }
    }
    
    var isOpendBefore: Bool? {
        set {
            def.setValue(newValue, forKey: "isOpendBefore")
        }
        get {
            if def.object(forKey: "isOpendBefore") == nil {
                return nil
            }
            return def.bool(forKey: "isOpendBefore")
        }
    }
    
    var userData: UserResponse? {
        set {
            if let userData = newValue {
                let encoder = JSONEncoder()
                do {
                    let data = try encoder.encode(userData)
                    def.set(data, forKey: "userData")
                } catch {
                    print("Error encoding userData: \(error)")
                }
            } else {
                def.removeObject(forKey: "userData")
            }
        }
        get {
            if let data = def.data(forKey: "userData") {
                let decoder = JSONDecoder()
                do {
                    let userData = try decoder.decode(UserResponse.self, from: data)
                    return userData
                } catch {
                    print("Error decoding userData: \(error)")
                    return nil
                }
            }
            return nil
        }
    }
    
    var token: String? {
        set {
            def.set(newValue, forKey: "authToken")
        }
        get {
            if def.object(forKey: "authToken") == nil {
                return nil
            }
            return def.string(forKey: "authToken")
        }
    }
}
