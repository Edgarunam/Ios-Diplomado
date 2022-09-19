//
//  ViewMoreViewController.swift
//  NavigationApp
//
//  Created by DISMOV on 02/09/22.
//

import UIKit

extension UIImageView {
    func loadFromMore(URLAddress: String) {
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
class ViewMoreViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var anioLabel: UILabel!
    @IBOutlet var directorLabel: UILabel!
    @IBOutlet var postLabel: UILabel!
    
    var recivedMovie : Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleLabel.text = recivedMovie?.title
        directorLabel.text = recivedMovie?.director
        anioLabel.text = recivedMovie?.year
        postLabel.text = recivedMovie?.plot
        movieImage.loadFromMore(URLAddress: recivedMovie!.posterUrl)
        
    }
    
}
