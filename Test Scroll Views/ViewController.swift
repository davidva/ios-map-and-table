import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var map: MKMapView!
    
    var mapMaxHeight: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.backgroundColor = UIColor.clearColor()
        let headerCell = tableView(tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        tableView.contentInset = UIEdgeInsetsMake(map.frame.height - headerCell.frame.height, 0, 0, 0)
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: false)
        
        if let nc = navigationController {
            mapMaxHeight = view.frame.height - nc.navigationBar.frame.height
        } else {
            mapMaxHeight = view.frame.height
        }
    }
    
    override func viewDidLayoutSubviews() {
        setMapHeight()
    }
    
    func setMapHeight() {
        let frame = map.frame
        let newHeight = mapMaxHeight - (mapMaxHeight + tableView.contentOffset.y)
        let newFrame = CGRectMake(frame.origin.x, frame.origin.y, frame.width, newHeight)
        map.frame = newFrame
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.textLabel?.text = "Banana \(indexPath.row + 1)"
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        setMapHeight()
    }
}
