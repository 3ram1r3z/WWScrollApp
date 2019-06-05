////
////  ViewController.swift
////  WWScroll
////
////  Created by Emmanuel Ramirez on 5/31/19.
////  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
////
//
//import UIKit
//
//class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 8
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
//        cell.textLabel?.text = "\(myArray[indexPath.row])"
//        cell.imageView?.image = UIImage(named: "bear_first.png")
//        return cell
//    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
//    
//    let headerTitles = ["Section 1", "Section 2", "Section 3"]
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return headerTitles[section]
//    }
//    
//    private let imageView: UIImageView = {
//        let image = UIImageView(image: #imageLiteral(resourceName: "leaf_third"))
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.contentMode = .scaleAspectFit
//        return image
//    }()
//    
//
//    private let myArray: NSArray = ["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth"]
//    private var myTableView: UITableView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
//        let displayWidth: CGFloat = self.view.frame.width
//        let displayHeight: CGFloat = self.view.frame.height
//        
//        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
//        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
//        myTableView.dataSource = self
//        myTableView.delegate = self
//        
////        let sharedSession = URLSession.shared
//        
////        if let url = URL(string: "https://www.weightwatchers.com/assets/cmx/us/messages/collections.json")  {
////            let request = URLRequest(url: url)
////            do {
////                var contents = try String(contentsOf: url)
////                let test = hash(contents)
////                print(test)
////                for content in contents {
////                    for (a,b,c) in content {
////                        print(c)
////                        print("\n\n")
////                    }
////                }
////                for (filter, image, title) in contents. {
////                    print(filter)
////                }
////            } catch {}
////
////            let dataTask = sharedSession.dataTask(with: url, completionHandler: {(data, response, error) in
////                //what to do in here????
////
////
////                if error == nil {
////
////
//////                    let loadedImage = UIImage(data: data!)
//////                    let loadedText = UILabel()
//////                    loadedText.text = d
////                    print()
////                }
////            })
////            dataTask.resume()
////        }
//        
//        
//        
//        self.view.addSubview(myTableView)
//    }
//    
//
//
//}
//
