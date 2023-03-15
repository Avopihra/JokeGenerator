//
//  JokeViewModel.swift
//  JokeGenerator
//
//  Created by Viktoriya on 14.03.2023.
//

import Foundation
import RxSwift
import RxCocoa

struct JokeDetailModel {
    var data = Joke(type: "type", setup: "setup", punchline: "punchline", id: 0)
//    var isFunny: BehaviorRelay<Bool> = BehaviorRelay(value: false)
//    var isFunnyObservable: Observable<Bool> {
//        return isFunny.asObservable()
//    }
}

class JokeViewModel {
    
    let request = RequestManager()
    var jokes: Observable<[Joke]>?
    private let jokeViewModel = BehaviorRelay<[JokeDetailModel]>(value: [])
    var jokeViewModelObserver: Observable<[JokeDetailModel]> {
        return jokeViewModel.asObservable()
    }
    
    private let disposeBag = DisposeBag()
    
    func fetchJoke() {
        jokes = request.requestData()
        jokes?.subscribe(onNext: { (value) in
            var jokeViewModelArray = [JokeDetailModel]()
            for index in 0..<value.count {
                var joke = JokeDetailModel()
                joke.data = value[index]
                jokeViewModelArray.append(joke)
            }
            self.jokeViewModel.accept(jokeViewModelArray)
        }, onError: { (error) in
            _ = self.jokeViewModel.catch { (error) in
                Observable.empty()
            }
            print(error.localizedDescription)
        }).disposed(by: disposeBag)
    }
}
