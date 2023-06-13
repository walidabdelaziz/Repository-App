//
//  RepositoriesVC.swift
//  Repository-App
//
//  Created by Walid Ahmed on 13/06/2023.
//

import UIKit
import RxSwift
import RxCocoa

class RepositoriesVC: UIViewController {
    
    let reposViewModel = RepositoriesViewModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var reposTV: UITableView!
    @IBOutlet weak var reposLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setReposTableViewConfiguration()
        bindViewModel()
        reposViewModel.getRepos()
    }
    func setReposTableViewConfiguration(){
        reposTV.register(UINib(nibName: "ReposTVCell", bundle: nil), forCellReuseIdentifier: "ReposTVCell")
    }
    func bindViewModel(){
        reposViewModel.repos
            .bind(to: reposTV.rx.items(cellIdentifier: "ReposTVCell", cellType: ReposTVCell.self)) { row, repo, cell in
                cell.selectionStyle = .none
                cell.repo = repo
            }.disposed(by: disposeBag)
        
        // show error
        reposViewModel.error
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] error in
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            }).disposed(by: disposeBag)
        
        // show loader
        reposViewModel.isLoading.asObservable()
            .bind { (loading) in
                DispatchQueue.main.async {
                    loading ? Utils.showLoader(self.view) : Utils.hideLoader()
                }
            }.disposed(by: disposeBag)
    }
    
}
