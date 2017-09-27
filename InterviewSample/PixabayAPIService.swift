//
//  PixabayAPIService.swift
//  InterviewSample
//
//  Created by Eugen Fedchenko on 9/27/17.
//  Copyright © 2017 wirex. All rights reserved.
//

import UIKit

protocol PixabayAPIService {
    func query(completion: @escaping (PixabayQueryResult?, Error?) -> Void)
    func loadImage(byUrl: String, completion: @escaping (UIImage?) -> Void)
}

// MARK:
class PixabayAPIServiceImpl: PixabayAPIService {
   
    let url = URL(string: "https://pixabay.com/api/?key=3218913-89118caf89975435877c66c86&image_type=photo")!
    
    func query(completion: @escaping (PixabayQueryResult?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                safeCall { completion(nil, error) }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(PixabayQueryResult.self, from: data)
                safeCall { completion(result, nil) }
            } catch {
                safeCall { completion(nil, error) }
            }
        }
        
        task.resume()
    }
    
    func loadImage(byUrl surl: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: surl) else {
            print("Invalid url = \(surl)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print("Load error, url = \(url), error = \(String(describing: error))")
                return
            }
            
            if let img = UIImage(data: data) {
                safeCall { completion(img) }
            } else {
                print("Can't convert data to image")
            }
        }
        
        task.resume()
    }
}

// MARK:
func safeCall(block: @escaping () -> Void) {
    DispatchQueue.main.async {
        block()
    }
}
