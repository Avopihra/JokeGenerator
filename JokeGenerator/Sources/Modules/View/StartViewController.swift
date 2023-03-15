//
//  MainViewController.swift
//  JokeGenerator
//
//  Created by Viktoriya on 13.03.2023.
//

import UIKit
import RxSwift
import RxCocoa

class StartViewController: UIViewController {
    
    @IBOutlet private weak var firstPartLabel: UILabel?
    @IBOutlet private weak var secondPartLabel: UILabel?
    @IBOutlet private weak var funnyImageView: UIImageView?
    @IBOutlet private weak var generateButton: UIButton?
    @IBOutlet private weak var loader: UIActivityIndicatorView?
    
    @IBOutlet private weak var mentionView: UIView?
    
    fileprivate let bag = DisposeBag()
    let model = JokeViewModel()
    let jokes = BehaviorRelay<[JokeDetailModel]>(value: [])
    let duration = 1.0
    let delay = TimeInterval(floatLiteral: 1.5)
    //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        model.fetchJoke()
        bindUI()
    }

    @IBAction func showJoke(_ sender: Any) {
        
    }
    
    func bindUI() {
        loader?.startAnimating()
        model.jokeViewModelObserver.subscribe(onNext: { (value) in
            self.jokes.accept(value)
        },
        onError: { error in
            print("ERROR")
        }).disposed(by: bag)
        
        jokes.bind { (value) in
            for i in value {
                DispatchQueue.main.async {
                    self.firstPartLabel?.text = i.data.setup
                    self.loader?.stopAnimating()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        self.secondPartLabel?.text = i.data.punchline
                        //self.loader?.stopAnimating()
                        self.funnyImageView(isShow: true)
                    }
                }
            }
        }.disposed(by: bag)
    }
    
    func funnyImageView(isShow: Bool) {
        UIView.animate(withDuration: duration, delay: delay) {
            self.funnyImageView?.alpha = isShow ? 1 : 0
            self.mentionView?.alpha = isShow ? 1 : 0
            DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {
                self.generateButton?.alpha = 1
            }
        }
    }
    
}
