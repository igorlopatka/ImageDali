//
//  OpenAIService.swift
//  ImageDali
//
//  Created by Igor Łopatka on 07/09/2023.
//

import Foundation

class OpenAIService: ObservableObject {
    
    let key = APIKey.test
        
    func generateImage(from prompt: String) async throws -> [Photo] {
        
           var request = URLRequest(url: OpenAIEndpoint.generations.url)
        
           request.setValue("Bearer \(key)", forHTTPHeaderField: "Authorization")
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpMethod = "POST"
           
           let parameters: [String: Any] = [
               "prompt": prompt,
               "n": 1,
               "size": "256x256"
           ]
           
           let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
           
           request.httpBody = jsonData

           let (data, response) = try await URLSession.shared.data(for: request)
           let dalleResponse = try? JSONDecoder().decode(DALLEResponse.self, from: data)
           
           return dalleResponse?.data ?? []

       }
    
}
