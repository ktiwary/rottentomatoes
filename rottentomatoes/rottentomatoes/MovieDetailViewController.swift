//
//  MovieDetailViewController.swift
//  rottentomatoes
//
//  Created by Kushagra Kumar Tiwary on 9/13/14.
//  Copyright (c) 2014 myorg. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var navTitle: UINavigationItem!
//    @IBOutlet weak var movieTitle: UILabel!
//    @IBOutlet weak var synopsis: UILabel!
//    @IBOutlet weak var movieImage: UIImageView!
//    
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    internal var titleString = ""
    internal var synopsisString = ""
    internal var imageData = UIImage()
    
    @IBOutlet weak var movieDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        println("navTitle:\(self.titleString)")
        self.navTitle.title = self.titleString
//        self.movieTitle.text = self.titleString
        self.synopsisLabel.text = self.synopsisString
        self.posterView.image = imageData
        
    }
    
    
}
