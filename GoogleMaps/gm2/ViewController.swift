
import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationmaneger = CLLocationManager()

    @IBOutlet var myview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationmaneger.delegate = self
        self.locationmaneger.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.locationmaneger.requestWhenInUseAuthorization()
        self.locationmaneger.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        showlocation()
       // locationmaneger.stopUpdatingLocation()
    }
    
    func showlocation() {
        
        let camera = GMSCameraPosition.camera(withLatitude: (self.locationmaneger.location?.coordinate.latitude)!, longitude: (self.locationmaneger.location?.coordinate.longitude)!, zoom: 14)
        
        let mapview = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: self.myview.frame.width, height: self.myview.frame.height), camera: camera)
        
        mapview.settings.myLocationButton = true
        mapview.isMyLocationEnabled = true
        let marker = GMSMarker()
        marker.position = camera.target
        marker.snippet = "current Location"
        marker.map = mapview
        self.myview.addSubview(mapview)
    }

}

