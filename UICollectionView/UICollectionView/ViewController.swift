//
//  ViewController.swift
//  UICollectionView
//
//  Created by mac on 2017/5/10.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var imagges = ["p1","p2","p3","p4","p5","p6","p7","p8","p9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let screenRect = UIScreen.main.bounds
        let collectionRect = CGRect(x: 0, y: 20, width: screenRect.size.width, height: screenRect.size.height)
        
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 155, height: 135)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        
        
        let collectionView = UICollectionView(frame: collectionRect, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "reusedCell")
        self.view.addSubview(collectionView)
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imagges.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identy = "reusedCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identy, for: indexPath)
        let imageView:UIImageView? = cell.viewWithTag(1)as?UIImageView
        
        if imageView == nil {
            let image = UIImage(named: imagges[(indexPath as NSIndexPath).row])
            let imageView = UIImageView(image: image)
            
            imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
            imageView.layer.opacity = 0.5
            imageView.tag = 1
            cell.addSubview(imageView)
            
            
        }else{
            
            imageView?.image = UIImage(named: imagges[(indexPath as NSIndexPath).row])
            
        }
        
        cell.backgroundColor = UIColor.gray
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let imageView = cell?.viewWithTag(1)
        imageView?.layer.opacity = 1.0
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

