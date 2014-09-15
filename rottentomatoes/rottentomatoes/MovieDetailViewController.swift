//
//  MovieDetailViewController.swift
//  rottentomatoes
//
//  Created by Kushagra Kumar Tiwary on 9/13/14.
//  Copyright (c) 2014 myorg. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var navTitle: UINavigationItem!
//    @IBOutlet weak var movieTitle: UILabel!
//    @IBOutlet weak var synopsis: UILabel!
//    @IBOutlet weak var movieImage: UIImageView!
//    
    internal var titleString = ""
    internal var synopsisString = ""
    internal var imageData = UIImage()
    
    @IBOutlet weak var movieDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieDetailTableView.delegate = self
        movieDetailTableView.dataSource = self
        movieDetailTableView.reloadData()
        
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
//        self.synopsis.text = self.synopsisString
//        self.movieImage.image = imageData
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("movieDetailViewId") as MovieDetailTableViewCell
        cell.titleLabel.text = titleString
        cell.syopsisLabel.text = synopsisString
        cell.posterImageView.image = imageData
        return cell
    }
    
    
}
