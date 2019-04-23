//
//  DataModel.swift
//  PhoneCallModule
//
//  Created by Anton Boyarkin on 22/04/2019.
//

import Foundation
import XMLMapper

internal struct DataModel: Codable, XMLMappable {
    public var title: String?
    public var phone: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case phone
    }
    
    // XML Mapping
    public var nodeName: String! = "data"
    
    public init?(map: XMLMap) {
        self.mapping(map: map)
    }
    
    public mutating func mapping(map: XMLMap) {
        title <- map["title"]
        phone <- map["phone"]
    }
}
