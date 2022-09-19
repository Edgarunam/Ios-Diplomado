//
//  FavoritesViewController.swift
//  NavigationApp
//
//  Created by DISMOV on 02/09/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let posters = ["0","1","2","3","4"]
    @IBOutlet var favoritePosterImage: UIImageView!
    
    @IBOutlet var posterPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //favoritePosterImage.image = UIImage(named: "0")
        
        posterPageControl.numberOfPages = posters.count
        favoritePosterImage.image = UIImage(named: posters.first!)
    }

    @IBAction func posterPageControlAction(_ sender: UIPageControl) {
        
        favoritePosterImage.image = UIImage(named: posters[posterPageControl.currentPage])
        
    }
    
    
    @IBAction func RightSwipe(_ sender: Any) {
        print("Right Swipe")
        posterPageControl.currentPage = posterPageControl.currentPage + 1
               favoritePosterImage.image = UIImage(named: posters.first!)
        
    }
    
    @IBAction func leftRight(_ sender: Any) {
        print("Left Swipe")
        if posterPageControl.currentPage == 0 {
            posterPageControl.currentPage = posters.count - 1
            favoritePosterImage.image = UIImage(named: posters[posterPageControl.currentPage])
            
        }
        else {
            posterPageControl.currentPage = posterPageControl.currentPage - 1
            favoritePosterImage.image = UIImage(named: posters[posterPageControl.currentPage])
            
        }
        
        
    }
}
