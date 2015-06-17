import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.backgroundColor = UIColor.clearColor()
        tableView.contentInset = UIEdgeInsetsMake(view.frame.height - 60, 0, 0, 0)
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        setMapHeight()

    }
    
    func setMapHeight() {
        let frame = self.map.frame
        let newHeight = 606 - (606 + tableView.contentOffset.y)
        let newFrame = CGRectMake(0, 0, frame.width, newHeight)
        self.map.frame = newFrame
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
