//
//  MenuViewController.swift
//  MovieKSY
//
//  Created by 소프트웨어컴퓨터 on 2022/06/12.
//

import UIKit

class MenuViewController: UIViewController {

    var movieName = ""
    var rank = ""
    var openDate = ""
    var audiCount = ""
    var salesAmt = ""
    var salesAcc = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "detailView") {
            guard let dest = segue.destination as? DetailViewController else {
                return
            }
            dest.movieName = movieName
        }
        else if (segue.identifier == "previewView") {
            guard let dest = segue.destination as? PreviewViewController else {
                return
            }
            dest.movieName = movieName
        }
        else {
            guard let dest = segue.destination as? MovieDetailViewController else {
                return
            }
            dest.movieName = movieName
            dest.rank = rank
            dest.openDate = openDate
            dest.audiCount = audiCount
            dest.salesAcc = salesAcc
            dest.salesAmt = salesAmt
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = movieName
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
