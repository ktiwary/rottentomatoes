//
//  MoviesViewController.swift
//  rottentomatoes
//
//  Created by Kushagra Kumar Tiwary on 9/13/14.
//  Copyright (c) 2014 myorg. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let urlString = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=khakbvwgcgb4qubh2fbx4epm&limit=20&country=US"
    
    var moviesArray :[NSDictionary] = []
    
    @IBAction func refreshMovies(sender: AnyObject) {
        refreshMovies()
     
        
    }
    
    func refreshMovies() {
        var request = NSURLRequest(URL: NSURL(string: urlString))
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()){
            (response :NSURLResponse!, data :NSData!, error :NSError!) -> Void in
            var rootObj = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
                        println("url result count:\(rootObj.count)")
            self.moviesArray = rootObj["movies"] as [NSDictionary]
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshMovies()
        
        
        
        
        // Do any additional setup after loading the view.
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
        let synopsis = movie["synopsis"] as String
        cell.titleLabel.text = "\(title)"
        let posters = movie["posters"] as NSDictionary
        cell.descriptionLabel.text = "\(synopsis)"
        populateThumbnail(posters["thumbnail"] as String, thumbnail: cell.posterLabel)
        return cell
    }
    
    func populateThumbnail(url :String, thumbnail: UIImageView) -> Void {
        
        var request = NSURLRequest(URL: NSURL(string: url))
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()){
            (response :NSURLResponse!, data :NSData!, error :NSError!) -> Void in
            thumbnail.image = UIImage(data: data)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
