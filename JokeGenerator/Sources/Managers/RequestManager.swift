//
//  RequestManager.swift
//  JokeGenerator
//
//  Created by Viktoriya on 14.03.2023.
//

import Foundation
import RxCocoa
import RxSwift

protocol RequestManagerProtocol {
     func requestData<T: Codable>() -> Observable<T>
}

class RequestManager: RequestManagerProtocol {
    let baseURL = URL(string: "https://official-joke-api.appspot.com/random_ten")!
    let session = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask? = nil
    
    func requestData<T: Codable>() -> Observable<T> {
        return Observable<T>.create { observer in
            self.dataTask = self.session.dataTask(with: self.baseURL, completionHandler: { (data, response, error) in
                do {
                    let model: [Joke] = try JSONDecoder().decode([Joke].self, from: data ?? Data())
                    observer.onNext(model as! T)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            })
            self.dataTask?.resume()
            return Disposables.create {
                self.dataTask?.cancel()
            }
        }
    }
}
