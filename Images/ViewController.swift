//
//  ViewController.swift
//  Images
//
//  Created by Parth Rai Sharma on 2020-05-21.
//  Copyright © 2020 Parth Rai Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var ImgView: UIImageView!
    
    @IBOutlet weak var BlurRadius: UISlider!
    
    var defaultImg: UIImage? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultImg = ImgView.image
        
    }

    
    @IBAction func BtnApplyFilter(_ sender: UIButton) {
        
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg, kCIInputRadiusKey:BlurRadius.value]
        ApplyFilters(filterName: "CIBoxBlur", filterParams: filterParams)
        
        
        
    }
    
    @IBAction func SepiaToneBtn(_ sender: UIButton) {
        
        
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg, kCIInputIntensityKey: BlurRadius.value ]
        ApplyFilters(filterName: "CISepiaTone", filterParams: filterParams)
          

             
    }
    
    
    @IBAction func ResetImg(_ sender: UIButton) {
        
       
        
        ImgView.image = defaultImg
        
    }
    
    func ApplyFilters(filterName:String , filterParams:[String:Any]){
        
        
        var filter = CIFilter(name: filterName, parameters: filterParams )


        //4. Create a context so that you can show the image back to use

        let context = CIContext(options: nil)


        //5. Convert CIImage result to CGI Image



        if let output = filter?.outputImage{
            
            if var cgiResult = context.createCGImage(output, from: output.extent){
                
                //6. Convert CGI Image into UIImage as a final result

                ImgView.image = UIImage(cgImage: cgiResult)
                
                
              
            }
        }


        
    }
}

