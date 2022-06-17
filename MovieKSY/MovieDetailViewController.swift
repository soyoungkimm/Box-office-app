//
//  MovieDetailViewController.swift
//  MovieKSY
//
//  Created by 소프트웨어컴퓨터 on 2022/06/12.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var movieName = ""
    var rank = ""
    var openDate = ""
    var audiCount = ""
    var salesAmt = ""
    var salesAcc = ""
    
    @IBOutlet weak var rank1: UILabel!
    @IBOutlet weak var openDate1: UILabel!
    @IBOutlet weak var audiCount1: UILabel!
    @IBOutlet weak var salesAmt1: UILabel!
    @IBOutlet weak var salesAcc1: UILabel!
    @IBOutlet weak var movieName1: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let numF = NumberFormatter()
        numF.numberStyle = .decimal
        var temp = 0
        var result = ""
        
        movieName1.text = movieName
        
        temp = Int(rank)!
        result = numF.string(for: temp)!+"위"
        rank1.text = result
        
        openDate1.text = openDate
        
        temp = Int(audiCount)!
        result = numF.string(for: temp)!+"명"
        audiCount1.text = result
        
        temp = Int(salesAmt)!
        result = numF.string(for: temp)!+"원"
        salesAmt1.text = result
        
        temp = Int(salesAcc)!
        result = numF.string(for: temp)!+"원"
        salesAcc1.text = result
        
        //openDate1.text = openDate
        //audiCount1.text = audiCount
        //salesAmt1.text = salesAmt
        //salesAcc1.text = salesAcc
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
