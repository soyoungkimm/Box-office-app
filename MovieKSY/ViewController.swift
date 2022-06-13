//
//  ViewController.swift
//  MovieKSY
//
//  Created by 소프트웨어컴퓨터 on 2022/05/24.
//

import UIKit

let name = ["aaa", "bbb", "ccc", "ddd", "eee"]

struct  MovieData : Codable {
    let  boxOfficeResult : BoxOfficeResult
}

struct  BoxOfficeResult : Codable {
    let  dailyBoxOfficeList : [DailyBoxOfficeList]
}

struct  DailyBoxOfficeList : Codable {
    let  movieNm : String
    let  audiCnt : String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var movieData : MovieData?
    let movieURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=3c47a88b3298a90aabde4fef7b450779&targetDt=20220522"
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        getData()
    }
    
    func getData() {
        if let url = URL(string: movieURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let JSONdata = data {
                    //print(JSONdata,response!)
                    let dataString = String(data: JSONdata, encoding: .utf8)
                    print(dataString!)
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(MovieData.self, from: JSONdata)
                        print(decodedData.boxOfficeResult.dailyBoxOfficeList[0].movieNm)
                        print(decodedData.boxOfficeResult.dailyBoxOfficeList[0].audiCnt)
                        self.movieData = decodedData
                        DispatchQueue.main.async {
                            self.table.reloadData()
                        }
                    }catch{
                        print(error)
                    }
                }
            }
            task.resume()
            
        }
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.description)
    }
    
}

