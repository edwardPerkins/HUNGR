//
//  NetWorkManager.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import Foundation


class NetWorkManager{
    
    private init(){}
    
    static let shared = NetWorkManager()
    
    func fetchData<T: Codable>(url: String, completion: @escaping (T) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data else { return }
            
            do {
                completion(try JSONDecoder().decode(T.self, from: data))
            }
            catch {
                print("error in network call", error)
            }
        }.resume()
    }
    
    func fetchImageData(url: String, completion: @escaping (Data) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data else { return }
            
            completion(data)
            
        }.resume()
    }
    
}
