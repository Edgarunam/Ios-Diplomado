//
//  HomeViewController.swift
//  NavigationApp
//
//  Created by DISMOV on 02/09/22.
//

import UIKit

class HomeViewController: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet var cardView: UIView!
    let movieDataManager = MovieDataManager()
    let genreDataManager = GenreDataManager()
    let defaultGenre = "Adventure"
    var selectGenre : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.layer.cornerRadius = 30
        cardView.layer.cornerCurve = .continuous
        cardView.layer.masksToBounds = true
        
        genreDataManager.fetch()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        genreDataManager.genreCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath)as! MovieCell
        let genre = genreDataManager.genreAt(index: indexPath.row)
        cell.movieGenreLabel.text = genre.genre
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectGenre = genreDataManager.genreValue(index: indexPath.row)
        self.performSegue(withIdentifier: "detailSegue", sender: Self.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        destination.receivedGenre = selectGenre
    }
}
