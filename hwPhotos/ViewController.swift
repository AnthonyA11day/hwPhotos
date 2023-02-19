//
//  ViewController.swift
//  hwPhotos
//
//  Created by Anthony on 14.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var sourse: [Photo] = Source.randomPhotos(with: 21)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubview()
    }
    
    func setupSubview() {
        view.backgroundColor = .systemGray4
        title = "Photos".localized()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "\(PhotoCell.self)")

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
//        layout.estimatedItemSize = .init(width: 120, height: 120)
        layout.itemSize = CGSize(width: view.frame.size.width/3,
                                 height: view.frame.size.width/3)
        
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = .zero
        layout.minimumLineSpacing = .zero
        
        return layout
    }
}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sourse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PhotoCell.self)",
                                                           for: indexPath) as? PhotoCell else {
           return UICollectionViewCell()
       }
       
        cell.imageView.image = UIImage(named: sourse[indexPath.item].imageName)
        return cell
    }
    
    //самописный метод для размера ячейки
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewFlowLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let size = CGSize(width: 200, height: 200)
//        return size
//    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected - \(sourse[indexPath.item])")
    }
    
}
