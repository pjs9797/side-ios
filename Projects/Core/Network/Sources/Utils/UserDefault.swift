//
//  UserDefault.swift
//  CoreNetwork
//
//  Created by 강민성 on 1/17/24.
//

import Foundation

@propertyWrapper
public struct UserDefault<T> {
    
    let key: String
    let defaultValue: T
    let storage: UserDefaults
    
    public var wrappedValue: T {
        get { self.storage.object(forKey: self.key) as? T ?? self.defaultValue }
        set { self.storage.set(newValue, forKey: self.key) }
    }
    
    public init(key: String, defaultValue: T, storage: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
    }
}
