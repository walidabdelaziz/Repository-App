//
//  RepositoriesViewModel.swift
//  Repository-App
//
//  Created by Walid Ahmed on 13/06/2023.
//

import Foundation
import RxSwift
import RxCocoa

class RepositoriesViewModel {

    let disposeBag = DisposeBag()
    let repos = BehaviorRelay<[Repos]>(value: [])
    let isSuccess = BehaviorRelay<Bool>(value: false)
    let isLoading = BehaviorRelay<Bool>(value: false)
    let error = PublishSubject<Error>()
    let loadNextPageTrigger = PublishSubject<Void>()

    func getRepos() {
        guard !isLoading.value else { return }
        self.isLoading.accept(true)

        NetworkManager.shared.request(from: Consts.REPOS) { [weak self] (result: Result<[Repos]>) in
                guard let self = self else { return }
                self.isLoading.accept(false)

                switch result {
                case .success(let response):
                    self.repos.accept(response)
                case .failure(let error):
                    // handle error
                    self.error.onNext(error)
                }
            }
    }
}
