import UIKit

class CollectionViewController: UIViewController {
    
    // MARK: - Variables
    private var names = Array<String>()
    private var filteredNames = Array<String>()
    private var oldValueStepper: Double = 0
    private let reuseIdentifier = "Cell"
    private let itemsToBeAdded = ["Agra", "Ranchi", "UP", "BIhar", "Vadodara", "Bhopal", "Rajkot", "Bhavnagr", "Amreli"]
    
    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var stepper: UIStepper!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialData()
    }
    
    // MARK: - Actions
    @IBAction func stepperClick(_ sender: UIStepper) {
        print(sender.value)
        if (sender.value > oldValueStepper) {
            oldValueStepper += Double(Constants.ONE)
            if let item = itemsToBeAdded.randomElement() {
                names.append(item)
                filteredNames.append(item)
                collectionView.reloadData()
            }
        } else {
            oldValueStepper -= Double(Constants.ONE)
            names.removeLast()
            filteredNames.removeLast()
            collectionView.reloadData()
        }
    }
    
} // End of class

//MARK: - File Private Functions
extension CollectionViewController {
    
    fileprivate func initialData() {
        names = ["Mumbai", "Delhi", "Bangalore", "Hyderabad", "Ahmedabad", "Chennai", "Kolkata", "Surat", "Pune", "Jaipur", "Maharashtra", "Delhi", "Karnataka", "Telangana", "Gujarat", "Tamil Nadu ", "West Bengal", "Rajasthan", "Bihar"]
        filteredNames = names
        stepper.value = Double(filteredNames.count)
        oldValueStepper = Double(filteredNames.count)
        hideKeyboardWhenTapAround()
    }
    
} // End of Extension

// MARK: - UICollectionViewDataSource
extension CollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constants.COLLECTIONVIEW_NUMBER_OF_SECTIONS
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView .dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.lblName.text = filteredNames[indexPath.row]
        cell.imgItem?.image = UIImage(named: "search")
        return cell
    }
    
} // End of Extension

// MARK: - UISearchBarDelegate
extension CollectionViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredNames = searchText.isEmpty ? names : names.filter({(dataString: String) -> Bool in
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        collectionView.reloadData()
    }
    
} // End of Extension

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width - 10
        return CGSize(width: collectionWidth/2 - 2, height: collectionWidth/4.3 - 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(Constants.COLLECTIONVIEW_MINIMUM_INTER_ITEM_SPACING_FOR_SECTION_AT)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(Constants.COLLECTIONVIEW_MINIMUM_LINE_SPACING_FOR_SECTION_AT)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5,left: 5,bottom: 0,right: 5)
    }
    
} // End of Extension
