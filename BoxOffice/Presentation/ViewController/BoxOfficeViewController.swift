import UIKit

final class BoxOfficeViewController: UIViewController {
  private let viewModel: BoxOfficeInput
  
  private let boxOfficeCollectionView: BoxOfficeCollectionView = BoxOfficeCollectionView()
  
  private lazy var boxOfficeListDataSource: BoxOfficeListDataSource = BoxOfficeListDataSource(self.boxOfficeCollectionView)
  
  init(viewModel: BoxOfficeInput) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .systemBackground
    self.title = "2021-02-24"
    setLayout()
    viewModel.viewDidLoad()
  }
  
  private func setLayout() {
    self.boxOfficeCollectionView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(boxOfficeCollectionView)
    
    NSLayoutConstraint.activate(
      [
        self.boxOfficeCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        self.boxOfficeCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        self.boxOfficeCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        self.boxOfficeCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ]
    )
  }
}

extension BoxOfficeViewController: BoxOfficeOutput {
  func updateBoxOffice(items: [DailyBoxOffice.ListItem]) {
    var snapshot = BoxOfficeListSnapShot()
    snapshot.appendSections([.movie])
    let list = items.map(BoxOfficeListItem.movie)
    snapshot.appendItems(list, toSection: .movie)
    Task {
      await MainActor.run {
        self.boxOfficeListDataSource.apply(snapshot)
      }
    }
  }
  
  func updateLoadingStatus() {
    
  }
  
  func showError(message: String) {
    
  }
}
