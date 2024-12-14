

import UIKit

class ViewController: UIViewController {
    
    var apiResult = [Model]()

    @IBOutlet weak var apiDataView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiDataView.estimatedRowHeight = 50
        
        apiDataView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cellProto")
        
        
        FetchApiHandler.sharedInstance.fetchAPIData(){ apiData in
            self.apiResult = apiData
            
            DispatchQueue.main.async {
                self.apiDataView.reloadData()
            }
        }
    }

}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiResult.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellProto", for: indexPath) as? TableViewCell
        else{
            return UITableViewCell()
        }
        let item = apiResult[indexPath.row]
        cell.labelID.text = "ID = \(item.id)"
        cell.labelTitle.text = "Title = \(item.title)"
        cell.labelBody.text = "Body = \(item.body)"
        
        return cell
    }
}


