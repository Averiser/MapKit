//
//  MapViewController.swift
//  InterestingPlaces
//
//  Created by MyMacBook on 08.01.2022.
//  Copyright © 2022 Razeware LLC. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

  @IBOutlet weak var mapView: MKMapView!
  var place: InterestingPlace?
  
  @IBAction func changeMapType(_ sender: UISegmentedControl) {
    
    if sender.selectedSegmentIndex == 0 {
      mapView.mapType = .standard
    } else {
      mapView.mapType = .satellite
    }
    
  }
  @IBAction func close(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  override func viewDidLoad() {
        super.viewDidLoad()
    
    
    if let place = place {
      let regionRadius: CLLocationDistance = 1000.0
      let region = MKCoordinateRegion(center: place.location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
      mapView.setRegion(region, animated: true)
    }
    mapView.delegate = self
    }

}

extension MapViewController: MKMapViewDelegate {
  func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
    print("rendering ...")
  }
}
