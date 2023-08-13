//
//  BusinessSearch.swift
//  LocalLure
//
//  Created by Ellie on 8/13/23.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinate()
}

