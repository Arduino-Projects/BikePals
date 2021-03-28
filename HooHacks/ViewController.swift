//
//  HooHacks
//
//  Created by Araad Shams on 2021-03-27.
//

import UIKit
import CoreBluetooth


class ViewController: UIViewController, CBPeripheralDelegate, CBCentralManagerDelegate  {
    
    static var centralManager: CBCentralManager!
    static var peripheral: CBPeripheral!
    static var characteristic : CBCharacteristic!
    static var deviceUUID = CBUUID.init(string: "0xFFE0")
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stsLoading: UIActivityIndicatorView!
    @IBOutlet weak var lblLoading: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    
    
    @IBOutlet weak var checkImg: UIImageView!
    @IBOutlet weak var labelSet: UILabel!
    @IBOutlet weak var btnContinue: UIButton!
    
    @IBOutlet weak var bg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewController.centralManager = CBCentralManager(delegate: self, queue: nil)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("Central state update")
        if central.state != .poweredOn {
            print("Central is not powered on")
        } else {
            print("Central scanning for", ViewController.deviceUUID);
            ViewController.centralManager.scanForPeripherals(withServices: [ViewController.deviceUUID])
        }
        
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        // We've found it so stop scan
        //                print(RSSI)
        let num = RSSI as! Int
        if (num < -50) {
            ViewController.centralManager.scanForPeripherals(withServices: [ViewController.deviceUUID])
        }
        else {
            ViewController.centralManager.stopScan()
            
            // Copy the peripheral instance
            ViewController.peripheral = peripheral
            ViewController.peripheral.delegate = self
            
            
            // Connect!
            UIView.animate(withDuration: 0.7, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.imageView.alpha = 0
                self.stsLoading.alpha = 0
                self.lblLoading.alpha = 0
                self.lblDescription.alpha = 0
                self.imgIcon.alpha = 0
                self.bg.alpha = 0
            }, completion: { (notUsed) in
                
                //notUsed is the boolean needed to be declared but not needed for use
                //Once completed moving icon into position and rotating it, fade in the logo
                UIView.animate(withDuration: 0.8, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                    self.checkImg.alpha = 1
                    self.labelSet.alpha = 1
                    
                }, completion: { (notUsed) in
                    
                    //notUsed is the boolean needed to be declared but not needed for use
                    //Once completed moving icon into position and rotating it, fade in the logo
                    UIView.animate(withDuration: 0.5, delay: 0.5, options: UIView.AnimationOptions.curveEaseOut, animations: {
                        self.btnContinue.alpha = 1
                        
                    }
                    
                    );
                    
                    
                });});
            ViewController.centralManager.connect(ViewController.peripheral, options: nil)
            
        }
    }
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        if peripheral == ViewController.peripheral {
            print("Connected to your Particle Board")
            peripheral.discoverServices([ViewController.deviceUUID])
        }
    }
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let characteristics = service.characteristics {
            for characteristic in characteristics {
                print(characteristic.uuid)
                
                //                        let data = Data("C".utf8)
                //                        peripheral.writeValue(data, for: characteristic, type: .withoutResponse)
                ViewController.characteristic = characteristic
                ViewController.peripheral.delegate = nil

                
                if characteristic.properties.contains(.read) {
                    peripheral.setNotifyValue(true, for: characteristic)
                    print("\(characteristic.uuid): properties contains .read")
                }
                if characteristic.properties.contains(.writeWithoutResponse) {
                    print("\(characteristic.uuid): properties contains .writeWithoutResponse")
                }
                if characteristic.properties.contains(.notify) {
                    print("\(characteristic.uuid): properties contains .notify")
                }
                if characteristic.properties.contains(.broadcast) {
                    print("\(characteristic.uuid): properties contains .broadcast")
                }
            }
        }
    }
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let services = peripheral.services {
            for service in services {
                print(service.uuid)
                peripheral.discoverCharacteristics(nil, for: service)
                
            }
        }
    }
    
    @IBAction func btnContPressed(_ sender: Any) {
        performSegue(withIdentifier: "setupToMain", sender: self)
    }
}

