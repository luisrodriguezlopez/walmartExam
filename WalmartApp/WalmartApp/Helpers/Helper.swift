//
//  Helper.swift
//  WalmartApp
//
//  Created by Luis R on 08/09/23.
//

import Foundation
import UIKit

func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        // Check for errors
        if let error = error {
            print("Error downloading image: \(error.localizedDescription)")
            completion(nil)
            return
        }
        
        // Check if we received a valid response
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("Invalid response or status code")
            completion(nil)
            return
        }
        
        // Check if we received data
        guard let data = data, let image = UIImage(data: data) else {
            print("Invalid data or couldn't create UIImage")
            completion(nil)
            return
        }
        
        // Image downloaded successfully
        completion(image)
    }.resume()
}
