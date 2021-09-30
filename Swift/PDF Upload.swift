//
//  PDF Upload.swift
//  
//
//  Created by Kunal's MacBook on 30/09/21.
//

import Foundation


let tempUrl = NSData(contentsOf: urls[0])

let pdfString : String = tempUrl!.base64EncodedString(options: .endLineWithLineFeed)

self.pdfstring = NSData(contentsOf: urls[0])
self.tempData = Data(base64Encoded: pdfString, options: .ignoreUnknownCharacters)!
//MARK:- //Upload to PDF server
func UploadToPdfServer(){
    self.globalDispatchgroup.enter()
    
    DispatchQueue.main.async {
        SVProgressHUD.show(withStatus: LocalizationSystem.sharedInstance.localizedStringForKey(key: "loading_please_wait", comment: ""))
    }
    
    let langID = UserDefaults.standard.string(forKey: "langID")
    
    let parameters = [
        "lang_id" : "\(self.LangID!)" , "user_id" : "\(self.UserID!)" ,"receiver_id" : "\(self.SenderId!)" ,"msg" : "\(self.MessageTextView.text ?? "")" , "chatlatitude" : "\(self.ChatLatitude!)" ,"chatlongitude" : "\(self.ChatLongitude!)"]
    print("Parameter.....",parameters)
    Alamofire.upload(
        multipartFormData: { MultipartFormData in
            
            for (key, value) in parameters {
                MultipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
            
            print("Tempdata",self.tempData ?? "")
            
            MultipartFormData.append(self.tempData, withName: "message_img[]", fileName: "iosPDF.pdf", mimeType: "application/pdf")
            
    }, to: (GLOBALAPI + "app_user_send_message"))
        
    { (result) in
        switch result {
        case .success(let upload, _, _):
            
            upload.uploadProgress(closure: { (Progress) in
                print("Upload Progress: \(Progress.fractionCompleted)")
            })
            
            upload.responseJSON { response in
                
                print("response",response)
                //
                print(response.request!)  // original URL request
                print(response.response!) // URL response
                print(response.data!)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    
                    print("PDF Response Response-----: \(JSON)")
                    
                    DispatchQueue.main.async {
                        
                        SVProgressHUD.dismiss()
                        
                        self.displayToastMessage(LocalizationSystem.sharedInstance.localizedStringForKey(key: "message_sent_successfully", comment: ""))
                        
                        self.MessageTextView.text = ""
                    }
                }
                else {
                    DispatchQueue.main.async {
                        
                        self.globalDispatchgroup.leave()
                        
                        SVProgressHUD.dismiss()
                        
                    }
                }
            }
            
        case .failure(let encodingError):
            
            print(encodingError)
            
            DispatchQueue.main.async {
                
                self.globalDispatchgroup.leave()
                
                SVProgressHUD.dismiss()
            }
        }
    }
}
