//
//  DALLEResponse.swift
//  ImageDali
//
//  Created by Igor Łopatka on 07/09/2023.
//

import Foundation

struct DALLEResponse: Decodable {
    let created: Int
    let data: [Photo]
}

struct Photo: Decodable {
    let url: String
}
