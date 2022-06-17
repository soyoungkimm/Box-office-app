//
//  ViewController.swift
//  MovieKSY
//
//  Created by 소프트웨어컴퓨터 on 2022/05/24.
//

import UIKit

struct  MovieData : Codable {
    let  boxOfficeResult : BoxOfficeResult
}

struct  BoxOfficeResult : Codable {
    let  dailyBoxOfficeList : [DailyBoxOfficeList]
}

struct  DailyBoxOfficeList : Codable {
    let  movieNm : String
    let  audiCnt : String
    let  audiAcc : String
    let  rank : String
    let  openDt : String
    let  salesAmt : String
    let  salesAcc : String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var movieData : MovieData?
    var movieURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=3c47a88b3298a90aabde4fef7b450779&targetDt="
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        movieURL += makeYesterdayString()
        getData()
    }
    
    func makeYesterdayString() -> String {
        let y = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let dateF = DateFormatter()
        dateF.dateFormat = "yyyyMMdd"
        let day = dateF.string(from: y)
        return day
    }

    func getData() {
        guard let url = URL(string: movieURL) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            guard let JSONdata = data else { return }
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(MovieData.self, from: JSONdata)
                self.movieData = decodedData
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            }catch{
                print(error)
            }
            
        }
        task.resume()
            
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? MenuViewController else {
            return
        }
        let myIndexPath = table.indexPathForSelectedRow!
        let row = myIndexPath.row
        dest.movieName = (movieData?.boxOfficeResult.dailyBoxOfficeList[row].movieNm)!
        dest.rank = (movieData?.boxOfficeResult.dailyBoxOfficeList[row].rank)!
        dest.openDate = (movieData?.boxOfficeResult.dailyBoxOfficeList[row].openDt)!
        dest.audiCount = (movieData?.boxOfficeResult.dailyBoxOfficeList[row].audiCnt)!
        dest.salesAmt = (movieData?.boxOfficeResult.dailyBoxOfficeList[row].salesAmt)!
        dest.salesAcc = (movieData?.boxOfficeResult.dailyBoxOfficeList[row].salesAcc)!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        
        cell.movieName.text = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].movieNm
        
        
         if let aCnt = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].audiCnt {
             let numF = NumberFormatter()
             numF.numberStyle = .decimal
             let aCount = Int(aCnt)!
             let result = numF.string(for: aCount)!+"명"
             cell.audiCount.text = "어제:\(result)"
         }
        

         if let aAcc = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].audiAcc {
            let numF = NumberFormatter()
            numF.numberStyle = .decimal
            let aAccount = Int(aAcc)!
            let result2 = numF.string(for: aAccount)!+"명"
            cell.audiAccumulate.text = "누적:\(result2)"

         }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.description)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "박스오피스(영화진흥위원회제공:" + makeYesterdayString() + ")"
    }
    
}

