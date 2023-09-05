//
//  ColorTableViewController.swift
//  ColorDemo
//
//  Created by Mohit Mali on 04/09/23.
//

import UIKit

class ColorTableViewController: UIViewController {
    var colors:[UIColor] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColor()
        
        
        // Do any additional setup after loading the view.
    }
    func addRandomColor(){
        for _ in 0...500{
            colors.append(createRandomColor())
            
        }
    }
    func createRandomColor()-> UIColor{
        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1)
        return randomColor
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // let destVC = segue.destination as! DetailViewController
        // destVC.color = sender as? UIColor
        if segue.identifier == "DetailViewController" {
            var destVC = segue.destination as! DetailViewController
            destVC.color = sender as? UIColor
            
        }
        
    }
}
//     @IBAction func tempButtonTapped(_ sender: UIButton) {
//         performSegue(withIdentifier: "TocolorDetailVC", sender: nil)
//     }
extension ColorTableViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell") else{
            return UITableViewCell()
        }
        //   let color = colors[indexPath.row]
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: "ToColorDetail", sender: color)
        
    }
    
    
}

