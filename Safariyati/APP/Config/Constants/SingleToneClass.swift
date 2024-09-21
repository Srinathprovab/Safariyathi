//
//  SingleToneClass.swift
//  Safariyati
//
//  Created by Admin on 18/06/24.
//

import Foundation
import UIKit

func setupLabel(lbl:UILabel,textcolor:UIColor,font:UIFont) {
    lbl.textColor = textcolor
    lbl.font = font
}

func setupOnlyFont(lbl:UILabel,font:UIFont, text: String) {
    lbl.font = font
    lbl.text = text
}



func setupLabels(lbl:UILabel,text:String,textcolor:UIColor,font:UIFont) {
    lbl.text = text
    lbl.textColor = textcolor
    lbl.font = font
}

//MARK: - INITIAL SETUP LABELS
func setuplabels(lbl:UILabel,text:String,textcolor:UIColor,font:UIFont,align:NSTextAlignment) {
    lbl.text = text
    lbl.textColor = textcolor
    lbl.font = font
    lbl.numberOfLines = 0
    lbl.textAlignment = align
}


class MySingleton {
    // Declare static constant instance
    static let shared = MySingleton()
    
   
    
    //TIMER
    weak var delegate: TimerManagerDelegate?
    var timerDidFinish = false
    var timer: Timer?
    var totalTime = 1
    private var backgroundTask: UIBackgroundTaskIdentifier = .invalid
   
    
    //MARK: - ExecuteOnce
    func callonce() {
        
        if !UserDefaults.standard.bool(forKey: "ExecuteOnce") {
            
            defaults.set("OMR", forKey: UserDefaultsKeys.selectedCurrency)
            defaults.set("OMR", forKey: UserDefaultsKeys.selectedCurrencyType)
            defaults.set("oneway", forKey: UserDefaultsKeys.journeyType)
            
            
            UserDefaults.standard.set(true, forKey: "ExecuteOnce")
        }
    }
    
    
    //MARK: - convert Date Format
    func convertDateFormat(inputDate: String,f1:String,f2:String) -> String {
        
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = f1
        
        guard let oldDate = olDateFormatter.date(from: inputDate) else { return "" }
        
        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = f2
        
        return convertDateFormatter.string(from: oldDate)
    }
    
    
    
    //MARK: - getCountryList
//    func getCountryList() {
//        
//       
//        
//        // Get the path to the clist.json file in the Xcode project
//        if let jsonFilePath = Bundle.main.path(forResource: "clist", ofType: "json") {
//            do {
//                // Read the data from the file
//                let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonFilePath))
//                
//                // Decode the JSON data into a dictionary
//                let jsonDictionary = try JSONDecoder().decode([String: [Country_list]].self, from: jsonData)
//                
//                // Access the array of countries using the "country_list" key
//                if let countries = jsonDictionary["country_list"] {
//                    self.countrylist = countries
//                    
//                } else {
//                    print("Unable to find 'country_list' key in the JSON dictionary.")
//                }
//                
//                
//            } catch let error {
//                print("Error decoding JSON: \(error)")
//            }
//        } else {
//            print("Unable to find clist.json in the Xcode project.")
//        }
//        
//        
//    }
    
    
    
    //MARK: - convertToDesiredFormat

    func convertToDesiredFormat(_ inputString: String) -> String {
        if let number = Int(inputString.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) {
            if inputString.contains("Kilograms") {
                return "\(number) kg"
            } else if inputString.contains("Kg") {
                return "\(number) Kilograms"
            } else if inputString.contains("NumberOfPieces") {
                return "\(number) Piece per person."
            }
        }
        return "Invalid input format."
    }
    
    
    
   
    
    //MARK: - Timer SETUP
    func startTimer(time:Int) {
        endBackgroundTask() // End any existing background task (if any)
        backgroundTask = UIApplication.shared.beginBackgroundTask { [weak self] in
            self?.endBackgroundTask()
        }
        
        // Reset the totalTime to its initial value (e.g., 60 seconds)
        totalTime = time
        
        // Schedule the timer in the common run loop mode
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    
    @objc func updateTimer() {
        if totalTime != 0 {
            totalTime -= 1
            delegate?.updateTimer()
        }
        
//        else if totalTime == 60 {
//            triggerLocalNotification()
//        }
        
        else {
            sessionStop()
            delegate?.timerDidFinish()
            endBackgroundTask()
        }
    }
    
    @objc func sessionStop() {
        if let timer = timer {
            timer.invalidate()
            self.timer = nil
        }
    }
    
    func stopTimer() {
        if let timer = timer {
            timer.invalidate()
            self.timer = nil
        }
    }
    
//     func triggerLocalNotification() {
//            let content = UNMutableNotificationContent()
//            content.title = "Time Alert"
//            content.body = "The timer is about to expire in 60 seconds!"
//            content.sound = .default
//
//            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
//
//            UNUserNotificationCenter.current().add(request) { error in
//                if let error = error {
//                    //print("Error scheduling local notification: \(error)")
//                }
//            }
//        }
    
    
    private func endBackgroundTask() {
        guard backgroundTask != .invalid else { return }
        UIApplication.shared.endBackgroundTask(backgroundTask)
        backgroundTask = .invalid
    }
    
    
    
    func setAttributedTextnew(str1:String,str2:String,lbl:UILabel,str1font:UIFont,str2font:UIFont,str1Color:UIColor,str2Color:UIColor)  {
        
        let atter1 = [NSAttributedString.Key.foregroundColor:str1Color,
                      NSAttributedString.Key.font:str1font] as [NSAttributedString.Key : Any]
        let atter2 = [NSAttributedString.Key.foregroundColor:str2Color,
                      NSAttributedString.Key.font:str2font] as [NSAttributedString.Key : Any]
        
        let atterStr1 = NSMutableAttributedString(string: str1, attributes: atter1)
        let atterStr2 = NSMutableAttributedString(string: str2, attributes: atter2)
        
        
        let combination = NSMutableAttributedString()
        combination.append(atterStr1)
        combination.append(atterStr2)
        
        lbl.attributedText = combination
        
    }
    
    
    func convertToPC(input: String) -> String? {
        // Split the input string by space
        let components = input.components(separatedBy: " ")
        
        // Check if the input string follows the "NumberOfPieces X" format
        if components.count == 2, components[0] == "NumberOfPieces", let number = Int(components[1]) {
            return "\(number)pc"
        }
        
        // Check if the input string follows the "X Kilograms" format
        if components.count == 2, let number = Int(components[0]), components[1].lowercased() == "kilograms" {
            return "\(number)kg"
        }
        
        // Return nil if the input format is invalid
        return nil
    }

   
    
}


protocol TimerManagerDelegate: AnyObject {
    func timerDidFinish()
    func updateTimer()
}



