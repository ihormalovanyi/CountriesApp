//
//  ImageLoading.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import UIKit

//It will be good to use Kingsfisher or SDWebImage or create own loader with cache. But for this test project, I decided to use 'every-time-image-loader' as a simplification
@propertyWrapper
final class ImageLoading {
    
    private var activeTask: URLSessionDataTask?
    
    var wrappedValue: UIImageView = UIImageView()
    var projectedValue: String = "" {
        didSet {
            loadImage()
        }
    }
    
    func loadImage() {
        activeTask?.cancel()
        activeTask = nil
        
        guard let url = URL(string: projectedValue) else { return }
        
        activeTask = URLSession.shared.dataTask(with: url, completionHandler: { [weak self] data, _, _ in
            if let data = data {
                DispatchQueue.main.async {
                    self?.wrappedValue.image = UIImage(data: data)
                }
            }
        })
        activeTask?.resume()
    }
    
}
