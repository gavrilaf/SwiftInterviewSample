//
//  ViewController.swift
//  InterviewSample
//
//  Created by Eugen Fedchenko on 9/27/17.
//  Copyright © 2017 wirex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let service = PixabayAPIServiceImpl()
    
    var items = [PixabayPhoto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusLabel.text = "Loading..."
        
        tableView.delegate = self
        tableView.dataSource = self
        
        service.query { [weak self] (result, error) in
            guard let sself = self else { return }
            
            sself.spinner.stopAnimating()
            
            if let result = result {
                sself.statusLabel.text = "Load ok"
                sself.items = result.hits
                sself.tableView.reloadData()
            } else if let error = error {
                sself.statusLabel.text = "Error: \(error)"
            } else {
                sself.statusLabel.text = "Error: no data"
            }
        }
    }

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: PixabayPhotoCell.id) as! PixabayPhotoCell
        
        cell.thumb.image = nil
        cell.user.text = item.user
        cell.tags.text = item.tags
        
        service.loadImage(byUrl: item.previewUrl) { (img) in
            if let img = img {
                cell.thumb.image = img
            }
        }
        
        return cell
    }
}
