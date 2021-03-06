import Foundation
import CocoaLumberjack
import WordPressShared

class ActivityListViewController: UITableViewController, ImmuTablePresenter {

    let siteID: Int
    let service: ActivityServiceRemote

    fileprivate lazy var handler: ImmuTableViewHandler = {
        return ImmuTableViewHandler(takeOver: self)
    }()

    fileprivate var viewModel: ActivityListViewModel = .loading {
        didSet {
            handler.viewModel = viewModel.tableViewModel()
            updateNoResults()
        }
    }

    // MARK: - GUI

    fileprivate let noResultsView = WPNoResultsView()

    // MARK: - Constructors

    init(siteID: Int, service: ActivityServiceRemote) {
        self.siteID = siteID
        self.service = service
        super.init(style: .grouped)
        title = NSLocalizedString("Activity", comment: "Title for the activity list")
        noResultsView.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init?(blog: Blog) {
        precondition(blog.dotComID != nil)
        guard let api = blog.wordPressComRestApi(),
            let service = ActivityServiceRemote(wordPressComRestApi: api) else {
                return nil
        }

        self.init(siteID: Int(blog.dotComID!), service: service)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        WPStyleGuide.configureColors(for: view, andTableView: tableView)
        ImmuTable.registerRows([ActivityListRow.self], tableView: tableView)
        handler.viewModel = viewModel.tableViewModel()
        updateNoResults()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        service.getActivityForSite(siteID, count: 100, success: { (activities, _) in
            self.viewModel = .ready(activities)
        }, failure: { error in
            DDLogError("Error loading activities: \(error)")
            self.viewModel = .error(String(describing: error))
        })
    }

    func updateNoResults() {
        if let noResultsViewModel = viewModel.noResultsViewModel {
            showNoResults(noResultsViewModel)
        } else {
            hideNoResults()
        }
    }

    func showNoResults(_ viewModel: WPNoResultsView.Model) {
        noResultsView.bindViewModel(viewModel)
        if noResultsView.isDescendant(of: tableView) {
            noResultsView.centerInSuperview()
        } else {
            tableView.addSubview(withFadeAnimation: noResultsView)
        }
    }

    func hideNoResults() {
        noResultsView.removeFromSuperview()
    }
}

// MARK: - WPNoResultsViewDelegate

extension ActivityListViewController: WPNoResultsViewDelegate {
    func didTap(_ noResultsView: WPNoResultsView!) {
        let supportVC = SupportViewController()
        supportVC.showFromTabBar()
    }
}
