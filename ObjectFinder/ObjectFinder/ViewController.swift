//
//  ViewController.swift
//  ObjectFinder
//
//  Created by Milind Contractor on 31/7/20.
//  Copyright © 2020 madebyadvait:). All rights reserved.
//

import UIKit
import AVKit
import CoreML
import Vision

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    @IBOutlet weak var cameraView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCamera()
    }
    
    func setUpCamera() {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: device)  else { return }
        
        let  session = AVCaptureSession()
        session.sessionPreset = .hd1280x720
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = view.frame
        cameraView.layer.addSublayer(previewLayer)
        
        let output = AVCaptureVideoDataOutput()
        output .setSampleBufferDelegate(self, queue: DispatchQueue(label: "CameraOutput"))
        
        session.addInput(input)
        session.addOutput(output)
        session.startRunning()
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let sampleBuffer =  CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        scanImage(buffer: sampleBuffer)
        }
    
    func scanImage(buffer: CVPixelBuffer) {
        guard let model = try? VNCoreMLModel(for: CreateML().model) else { return }
        
        let request = VNCoreMLRequest(model: model) { request, _ in
            guard let results = request.results as? [VNClassificationObservation] else { return }
            guard let mostConfidentResult = results.first else { return }
            let confidentText = "\(Int(mostConfidentResult.confidence * 100.0))%"
            DispatchQueue.main.async {
                if mostConfidentResult.confidence >= 0.91 {
                    switch mostConfidentResult.identifier {
                    case "macOS Mojave":
                        self.resultLabel.text = "Nice! But recommend you to upgrade to macOS Catalina. It's great! \n \(confidentText)"
                    case "macOS Catalina":
                        self.resultLabel.text = "Your macOS Version is macOS Catalina! 😃 \n \(confidentText)"
                    case "Advait":
                        self.resultLabel.text = "Hello There, Advait! 👋🏽 \n \(confidentText)"
                    case "Milind":
                        self.resultLabel.text = "Hello There, Milind 👋🏽 \n \(confidentText)"
                    default:
                        return
                    }
                } else {
                    self.resultLabel.text = "idk what it is."
                }
            }
        }
        let requestHandler = VNImageRequestHandler(cvPixelBuffer: buffer, options: [:])
        
        do {
            try requestHandler.perform([request])
        } catch {
            print(error)
        }
    }
}
