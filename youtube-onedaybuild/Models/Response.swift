//
//  Response.swift
//  youtube-onedaybuild
//
//  Created by Lavanya B R on 09/07/24.
//

import Foundation
struct Response: Decodable {
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey{
        case items
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decodeIfPresent([Video].self, forKey: .items)
    }
}
