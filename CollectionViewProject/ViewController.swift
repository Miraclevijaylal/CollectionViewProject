//
//  ViewController.swift
//  CollectionViewProject
//
//  Created by Vijay Lal on 02/08/24.
//

import UIKit

class ViewController: UIViewController {
    let imageArray = ["one","two","three","four","five"]
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = view.safeAreaLayoutGuide.layoutFrame.width
        layout.itemSize = CGSize(width: (width / 2) - 32 , height: 200)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        return layout
    }()
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
}
extension ViewController {
    func initView() {
        let guide = view.safeAreaLayoutGuide
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        [collectionView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 0),
         collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16),
         collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16),
         collectionView.heightAnchor.constraint(equalToConstant: 210)
        ].forEach({ $0.isActive = true })
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.imageView.image = UIImage(named: imageArray[indexPath.row])
        return cell
    }
}
