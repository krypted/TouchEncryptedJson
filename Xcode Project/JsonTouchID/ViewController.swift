//
//  ViewController.swift
//  JsonTouchID
//  Change "Secret password" to your own key
//

import Cocoa
import LocalAuthentication
import RNCryptor

struct JsonData: Codable {
    let inputA: String
    let inputB: String
}

class ViewController: NSViewController {

    @IBOutlet weak var fieldA: NSTextField!
    
    @IBOutlet weak var fieldB: NSTextField!
    
    
    @IBOutlet var viewTextField: NSTextView!
    
    var context = LAContext()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func encryptButtonTapped(_ sender: Any) {
        encryptAndSaveJsonDocument()
    }
    
    @IBAction func decryptButtonTapped(_ sender: Any) {
        decryptAndShow()
    }
    func decryptAndShow() {
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("encrypted.json")
        // Decryption
        do {
            let password = "Secret password"
            let encryptedJsonData = try Data.init(contentsOf: fileURL)
            let originalData = try RNCryptor.decrypt(data: encryptedJsonData, withPassword: password)
            if let string = String.init(data: originalData, encoding: .utf8) {
                self.viewTextField.string = string
            }
            // ...
        } catch {
            print(error)
        }
    }
    func encryptAndSaveJsonDocument() {
        let reason = "Encrypt with Touch ID"
        context.evaluatePolicy(
            // .deviceOwnerAuthentication allows
            // biometric or passcode authentication
            .deviceOwnerAuthentication,
            localizedReason: reason
        ) { success, error in
            if success {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    
                    let model = JsonData.init(inputA: self.fieldA.stringValue, inputB: self.fieldB.stringValue)
                    if let data = try? JSONEncoder().encode(model) {
                        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("encrypted.json")
                        do {
                            
                            // Encryption
                            let password = "Secret password"
                            let ciphertext = RNCryptor.encrypt(data: data, withPassword: password)
                            try ciphertext.write(to: fileURL, options: .atomic)
                            NSWorkspace.shared.open(fileURL)
                        }
                        catch {
                            print(error)
                        }
                    }
                }
                
            } else {
                // Handle LAError error
            }
        }

    }


}

