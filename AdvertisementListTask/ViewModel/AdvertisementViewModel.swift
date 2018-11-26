//
//  AdvertisementViewModel.swift
//  AdvertisementListTask
//
//  Created by rakesh on 24/11/18.
//  Copyright © 2018 rakesh. All rights reserved.
//

import UIKit

class AdvertisementViewModel: NSObject {
    
    var serviceviewController:AdvertiseMentViewController!
    var serviceListArray:Array<ServicesModel> = []
    //MARK: - Class variables
    
    func setviewModelcontroller(controller:AdvertiseMentViewController) -> Void {
        
        serviceviewController = controller
    }
    
    func GetAdvertisementlistProcess () {
        guard checkNetwork() else { return }        //check network
        showProgress()

        ConnectionHandler.shared.getAPI(url: Constants.API.BaseURL) { (response, error) in
            guard let response = response
                else {
                   // print("Services error response : \(String(describing: error?.localizedDescription)) ---- Error:\(String(describing: error))")
                    hideProgress()
                    return
            }
            let status = response["status"] as! String
            if status == "OK" {

                let servicesArray = response["results"] as! [Any]
                self.updateServicesListToModel(params: servicesArray)        //update to mdoel
            } else {
                print("SignUp failure response :\(status)")
            }
        }
    }
    
    //Set API values to model
    func updateServicesListToModel(params:[Any]) -> Void {
        
        print(params)
        serviceListArray = []
        
        for index in 0..<params.count{
            let paramServicesDict = params[index] as! Dictionary<String,Any>
            
            let serviceModelObject = ServicesModel()
            serviceModelObject.type = paramServicesDict["type"] as? String
            serviceModelObject.title = paramServicesDict["title"] as? String
            serviceModelObject.abstract = paramServicesDict["abstract"] as? String
            serviceModelObject.published_date = paramServicesDict["published_date"] as? String
            
            let extraListParam = paramServicesDict["media"] as! [Any]
            
            for exIndex in 0..<extraListParam.count {
                let paramExServiceDict = extraListParam[exIndex] as! Dictionary<String,Any>
                let media = Media()
                media.type = paramExServiceDict["type"] as! String == "image" ? MediaType.Image : MediaType.Video
                media.caption = paramExServiceDict["caption"] as? String
                media.copyRight = paramExServiceDict["copyright"] as? String
                
                let mediaInfoArray = paramExServiceDict["media-metadata"] as! [[String : Any]]
                
                for data in mediaInfoArray {
                    let mediaInfo = MediaInfo()
                    mediaInfo.url = data["url"] as? String
                    mediaInfo.format = data["format"] as? String
                    media.mediaMetaData.append(mediaInfo)
                }
                serviceModelObject.mediaList.append(media)
            }
//            print("Media Count : \(serviceModelObject.mediaList.count)")
            serviceListArray.append(serviceModelObject)
            
        }
        
        updateMainQueue {       //reload with main thread
            self.serviceviewController.reloadServicesList()      //reload the service table
            //print(self.serviceListArray.count)
            hideProgress()
        }
        
       // print("serviceListArray:\(serviceListArray.count)")
    }
    
    //Array return methods
    func getServicesListArray() -> [ServicesModel]? {
        return serviceListArray
    }
    
    func getServicesListCount() -> Int {
        return serviceListArray.count
    }
    
    func getServicesListForIndex(indexItem:IndexPath) -> ServicesModel? {
        guard (serviceListArray.count) > 0 else {return nil}
        return serviceListArray[indexItem.row]
    }

}

class ServicesModel: NSObject {
    var type:String?
    var title:String?
    var abstract:String?
    var published_date:String?
    var mediaList:[Media]!
    override init() {
        mediaList = [Media]()
    }
    
}

class Media : NSObject {
    var type : MediaType!
    var caption : String!
    var copyRight : String!
    var mediaMetaData : [MediaInfo]!
    override init() {
         mediaMetaData = [MediaInfo]()
    }
}
class MediaInfo : NSObject {
    var url : String!
    var format : String!
}
enum MediaType {
    case Image
    case Video
}
