//
//  DetailViewController.swift
//  NavigationApp
//
//  Created by DISMOV on 02/09/22.
//

import UIKit

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    var receivedGenre : String = ""
    let movieDataManager = MovieDataManager()
    var selectMovie : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieDataManager.fetch(genre: receivedGenre)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDataManager.movieCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuOption", for: indexPath)as! MenuMovieCell
        let movie = movieDataManager.movieAt(index: indexPath.row)
        cell.menuMovieImage.loadFrom(URLAddress: movie.posterUrl)
        cell.menuMovieLabel.text = movie.title
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectMovie = movieDataManager.movieAt(index: indexPath.row)
        self.performSegue(withIdentifier: "viewMoreSegue", sender: Self.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewMoreViewController
        destination.recivedMovie = selectMovie
    }
    
}

