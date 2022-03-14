import UIKit
import MapKit

class MapUICompViewController: UIViewController {
    
    // MARK: - Variables
    var locationNamesArray = ["Ahemdabad", "Vadodra", "Rajkot", "Porbandar", "Junagadh", "Jamnagar", "Surat", "Bhavanagr"]
    var locationCoordinates = [CLLocationCoordinate2D]()
    
    // MARK: - Outlets
    @IBOutlet weak var locationPickerView: UIPickerView!
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialData()
    }
    
} // End of class

// MARK: - UIPickerViewDelegate
extension MapUICompViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationNamesArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedAnnotation = mapView.annotations
        for annotation in selectedAnnotation {
            mapView.removeAnnotation(annotation)
        }
        setPinUsingMKPlacemark(row: row)
    }
    
} // End of Extension

// MARK: - UIPickerViewDataSource
extension MapUICompViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Constants.ONE
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationNamesArray.count
    }
    
} // End of Extension

// MARK: - File Private Functions
extension MapUICompViewController {
    
    fileprivate func initialData() {
        locationCoordinates.append(CLLocationCoordinate2D(latitude: 23.0282395, longitude: 72.4987348))
        locationCoordinates.append(CLLocationCoordinate2D(latitude: 22.4168315, longitude: 73.0336582))
        locationCoordinates.append(CLLocationCoordinate2D(latitude: 22.2736308, longitude: 70.7512551))
        locationCoordinates.append(CLLocationCoordinate2D(latitude: 21.6355367, longitude: 69.595266))
        locationCoordinates.append(CLLocationCoordinate2D(latitude: 21.5307113, longitude: 70.3675686))
        locationCoordinates.append(CLLocationCoordinate2D(latitude: 22.474474, longitude: 69.9883722))
        locationCoordinates.append(CLLocationCoordinate2D(latitude: 21.1594627, longitude: 72.6822067))
        locationCoordinates.append(CLLocationCoordinate2D(latitude: 21.7639097, longitude: 72.1198863))
    }
    
    fileprivate func setPinUsingMKPlacemark(row: Int) {
        let pin = MKPointAnnotation()
        pin.coordinate = locationCoordinates[row]
        pin.title = locationNamesArray[row]
        pin.subtitle = locationNamesArray[row]
        let coordinateRegion = MKCoordinateRegion(center: pin.coordinate, latitudinalMeters: CLLocationDistance(Constants.MAPVIEW_AREA_SIZE), longitudinalMeters: CLLocationDistance(Constants.MAPVIEW_AREA_SIZE))
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.addAnnotation(pin)
    }
    
} // End of Extension
