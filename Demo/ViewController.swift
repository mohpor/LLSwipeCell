//
//  ViewController.swift
//  LLSwipeCell
//
//  Created by eugene on 2/24/16.
//  Copyright © 2016 Eugene Ovchynnykov. All rights reserved.
//

import UIKit

class Cell: LLSwipeCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let button1 = UIButton()
        button1.setTitle("1", for: .normal)
        button1.frame = CGRect(x: 0, y: 0, width: 50, height: 10)
        button1.backgroundColor = .red
        let button2 = UIButton()
        button2.setTitle("2", for: .normal)
        button2.frame = CGRect(x: 0, y: 0, width: 50, height: 10)
        button2.backgroundColor = .green
        leftButtons = [button1, button2]
        
        let button3 = UIButton()
        button3.setTitle("3", for: .normal)
        button3.frame = CGRect(x: 0, y: 0, width: 50, height: 10)
        button3.backgroundColor = .cyan
        let button4 = UIButton()
        button4.setTitle("4", for: .normal)
        button4.frame = CGRect(x: 0, y: 0, width: 50, height: 10)
        button4.backgroundColor = .blue
        rightButtons = [button3, button4]
    }
}

class OdeSideCell: LLSwipeCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let button3 = UIButton()
        button3.setTitle("3", for: .normal)
        button3.frame = CGRect(x: 0, y: 0, width: 50, height: 10)
        button3.backgroundColor = .cyan
        let button4 = UIButton()
        button4.setTitle("4", for: .normal)
        button4.frame = CGRect(x: 0, y: 0, width: 50, height: 10)
        button4.backgroundColor = .blue
        rightButtons = [button3, button4]
    }
}

class LockedSwipeCell: LLSwipeCell {
    
    @IBAction func didTapOpenRightButtons(sender: AnyObject) {
        expandRightButtons()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let button3 = UIButton()
        button3.setTitle("3", for: .normal)
        button3.frame = CGRect(x: 0, y: 0, width: 50, height: 10)
        button3.backgroundColor = .cyan
        let button4 = UIButton()
        button4.setTitle("4", for: .normal)
        button4.frame = CGRect(x: 0, y: 0, width: 50, height: 10)
        button4.backgroundColor = .blue
        rightButtons = [button3, button4]
        
        canOpenRightButtons = false
    }
}


class InitWithStyleSwipeCell: LLSwipeCell {
    let label = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        slideContentView = UIView()
        contentView.addSubview(slideContentView)
        
        label.text = "swipe left"
        slideContentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["label": label]
        let vertCons = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[label]-0-|", options: [], metrics: nil, views: views)
        slideContentView.addConstraints(vertCons)
        let horizCons = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[label]-0-|", options: [], metrics: nil, views: views)
        slideContentView.addConstraints(horizCons)

        
        let button1 = UIButton()
        button1.setTitle("1", for: .normal)
        button1.frame = CGRect(x: 0, y: 0, width: 50, height: 10)
        button1.backgroundColor = .red
        leftButtons = [button1]
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let cells: [AnyClass] = [Cell.self, OdeSideCell.self, LockedSwipeCell.self, InitWithStyleSwipeCell.self]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(InitWithStyleSwipeCell.self, forCellReuseIdentifier: "InitWithStyleSwipeCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = String(describing: cells[indexPath.row])
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        return cell
    }
}

