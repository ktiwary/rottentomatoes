//
//  MoviesViewController.swift
//  rottentomatoes
//
//  Created by Kushagra Kumar Tiwary on 9/13/14.
//  Copyright (c) 2014 myorg. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let urlString = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=khakbvwgcgb4qubh2fbx4epm&limit=20&country=US"
    
    var refreshControl:UIRefreshControl!
    
    var moviesArray :[NSDictionary] = []
    
    
    func refreshMovies() {
        MMProgressHUD.showWithTitle("Loading", status: "25%")
        var request = NSURLRequest(URL: NSURL(string: urlString))
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()){
            (response :NSURLResponse!, data :NSData!, error :NSError!) -> Void in
            if(error != nil) {
                self.errorLabel.text = "Network Error!"
            } else {
                self.errorLabel.text = ""
                var rootObj = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
                println("url result count:\(rootObj.count)")
                self.moviesArray = rootObj["movies"] as [NSDictionary]
                self.tableView.reloadData()
            }
            MMProgressHUD.dismiss()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refersh")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
        
        refreshMovies()
        
        // Do any additional setup after loading the view.
    }
    
    func refresh(sender:AnyObject)
    {
        refreshMovies()
        self.refreshControl.endRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cellId") as MovieTableViewCell
        let movie = moviesArray[indexPath.row]
        let title = movie["title"] as String
        cell.titleLabel.text = "\(title)"
        let synopsis = movie["synopsis"] as String
        cell.descriptionLabel.text = "\(synopsis)"
        let posters = movie["posters"] as NSDictionary
        let thumbnailUrlString = posters["thumbnail"] as String
        let thumbnailUrl = NSURL(string: thumbnailUrlString)
        cell.posterLabel.setImageWithURL(thumbnailUrl)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var movieDetailViewController = segue.destinationViewController as MovieDetailViewController
        let cell = sender as MovieTableViewCell
        movieDetailViewController.titleString = cell.titleLabel.text!
        movieDetailViewController.synopsisString = cell.descriptionLabel.text!
        movieDetailViewController.imageData = cell.posterLabel.image!
    }
    
    
}
