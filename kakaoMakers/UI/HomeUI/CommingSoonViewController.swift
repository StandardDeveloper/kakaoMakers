//
//  CommingSoonViewController.swift
//  kakaoMakers
//
//  Created by 이민욱 on 2021/06/15.
//

import UIKit
import Moya
import Kingfisher
import ExpandableLabel

class CommingSoonViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieNetworkProvider = MovieNetworkManager()
    var nowPlaying: [Movie] = []
    
    let numberOfCells : NSInteger = 20
    var states : Array<Bool>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight  = 650
        //tableView.estimatedRowHeight = 44
        //tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        
        states = [Bool](repeating: true, count: numberOfCells)
        
        getMovieData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func getMovieData() {
        
        movieNetworkProvider.getMovies(target: .nowPlaying) { results in
            
            self.nowPlaying = results
            
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        }
        
    }
}

extension CommingSoonViewController: UITableViewDelegate, UITableViewDataSource, ExpandableLabelDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nowPlaying.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commingSoonCell", for: indexPath) as! CommingSoonTableViewCell

        let imagePath = "https://image.tmdb.org/t/p/w500\(nowPlaying[indexPath.row].poster_path)"
        cell.posterImageView.kf.setImage(with: URL(string: imagePath))
        cell.titleLabel.text = nowPlaying[indexPath.row].title
        
        cell.contentsLabel.setLessLinkWith(lessLink: "Close", attributes: [.foregroundColor:UIColor.red], position: .left)
        cell.layoutIfNeeded()
        cell.contentsLabel.shouldCollapse = true
        cell.contentsLabel.textReplacementType = .word
        cell.contentsLabel.numberOfLines = 5
        cell.contentsLabel.collapsed = states[indexPath.row]
        cell.contentsLabel.text = nowPlaying[indexPath.row].overview
        
        cell.textColorChange(firstText: String(nowPlaying[indexPath.row].id), secondText: "명이 기다려요")
        cell.likeLabel.text = "\(String(nowPlaying[indexPath.row].id))명이 기다려요"
        cell.backgroundColor = UIColor(red: 244/255, green: 243/255, blue: 244/255, alpha: 1)
        return cell
    }
    
    func willExpandLabel(_ label: ExpandableLabel) {
        tableView.beginUpdates()
    }
    
    func didExpandLabel(_ label: ExpandableLabel) {
        let point = label.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) as IndexPath? {
            states[indexPath.row] = false
            DispatchQueue.main.async { [weak self] in
                self?.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
        tableView.endUpdates()
    }
    
    func willCollapseLabel(_ label: ExpandableLabel) {
        tableView.beginUpdates()
    }
    
    func didCollapseLabel(_ label: ExpandableLabel) {
        let point = label.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) as IndexPath? {
            states[indexPath.row] = true
            DispatchQueue.main.async { [weak self] in
                self?.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
        tableView.endUpdates()
    }
    
}







