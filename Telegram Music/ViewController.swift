//
//  ViewController.swift
//  Telegram Music
//
//  Created by Ismatulla Mansurov on 12/18/21.
//

import UIKit
import TDLibKit
enum Section: CaseIterable {
      case favorite
    case all
  }

class ViewController: UIViewController, UICollectionViewDelegate {


    var telegramLabel: UILabel!
    var chatSearch: UITextField!
    var chatAuthor: UILabel!
    var chatLastMessage: UILabel!
 
    private lazy var collectionView: UICollectionView = {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>!
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let config = UICollectionLayoutListConfiguration(appearance:
          .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    

    

    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.blue
        
        telegramLabel = UILabel()
        telegramLabel.translatesAutoresizingMaskIntoConstraints = false
        telegramLabel.textAlignment = .right
        telegramLabel.text = "Telegram Music"
        telegramLabel.font = .boldSystemFont(ofSize: 24)
        telegramLabel.textColor = .white
        view.addSubview(telegramLabel)
        
        NSLayoutConstraint.activate([
            telegramLabel.topAnchor.constraint(equalTo:  view.layoutMarginsGuide.topAnchor),
            telegramLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
