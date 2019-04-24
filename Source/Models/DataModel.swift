//
//  DataModel.swift
//  PhoneCallModule
//
//  Created by Anton Boyarkin on 22/04/2019.
//

import Foundation

internal struct DataModel: Codable {
    public var title: String?
    public var phone: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "#title"
        case phone = "#phone"
    }
    
    public init?(map: [String: Any]) {
        self.mapping(map: map)
    }
    
    public mutating func mapping(map: [String: Any]) {
        title = map[CodingKeys.title.rawValue] as? String
        phone = map[CodingKeys.phone.rawValue] as? String
    }
}
