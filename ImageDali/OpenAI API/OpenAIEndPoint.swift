//
//  OpenAIEndPoint.swift
//  ImageDali
//
//  Created by Igor Łopatka on 07/09/2023.
//

import Foundation

enum OpenAIEndpoint: String{
    
    private var baseURL: String { return "https://api.openai.com/v1/images/" }
    
    case generations
    case edits
    
    var url: URL {
            guard let url = URL(string: baseURL) else {
                preconditionFailure("The url is not valid")
            }
            return url.appendingPathComponent(self.rawValue)
    }
}
