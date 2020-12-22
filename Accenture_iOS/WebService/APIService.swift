//
//  Web.swift
//  Accenture_iOS
//
//  Created by XTGlobal on 21/12/20.
//  Copyright © 2020 Goutham. All rights reserved.
//

import Foundation


class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "https://api.mocki.io/v1/4f436f3b")!
    
    func apiToGetFactsData(completion : @escaping (UserModel) -> ()){
        

        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let factData = try! jsonDecoder.decode(UserModel.self, from: data)
            
                    completion(factData)
            }
            
        }.resume()
    }
    
}



