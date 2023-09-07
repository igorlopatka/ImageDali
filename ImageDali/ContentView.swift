//
//  ContentView.swift
//  ImageDali
//
//  Created by Igor Łopatka on 04/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var service = OpenAIService()
    
    @State var photos: [Photo] = []
    @State private var prompt: String = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(photos, id: \.url) { photo in
                    
                    AsyncImage(url: URL(string: photo.url)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    } placeholder: {
                        
                        Image(systemName: "photo.fill")
                        
                    }.frame(maxWidth: .infinity, maxHeight: 500)
                        .listRowInsets(.init(.zero))
                }
            }
            
            TextField("Enter the prompt", text: $prompt)
                .padding()
            
            Button(action: runOpenAIGeneration, label: {Text("Generate Text From Prompt")})
        }
        .padding()
    }
    
    func runOpenAIGeneration(){
        Task{
            do{
                self.photos = try await service.generateImage(from: prompt)
            }catch(let error){
                print(error)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
