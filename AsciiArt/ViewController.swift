//
//  ViewController.swift
//  AsciiArt
//
//  Created by RYUJI WATANABE on 2016/06/07.
//  Copyright © 2016年 RYUJI WATANABE. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    // font size
    var fontSize = CGFloat(5) {
        didSet {
            textView.font = UIFont(name: "Courier", size: fontSize)
        }
    }
    // select photo
    @IBAction func selectPhotoTapped(sender: AnyObject) {
        let sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        if !UIImagePickerController.isSourceTypeAvailable(sourceType) {
            return
        }
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate   = self
        presentViewController(picker, animated: true, completion: nil)
    }
    // up
    @IBAction func upButtonTapped(sender: AnyObject) {
        fontSize += 1
    }
    // down
    @IBAction func downButtonTapped(sender: AnyObject) {
        fontSize -= 1
    }
    // share
    @IBAction func shareButtonAction(sender: AnyObject) {
        let activity      = UIActivityViewController(activityItems: [textView.text], applicationActivities: nil)
        presentViewController(activity, animated: true, completion: nil)
    }
}
// MARK: - UIImagePickerControllerDelegate
extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image  = info[UIImagePickerControllerOriginalImage]
        let text   = image?.ASCIIDescription() as? String ?? "error"
        let pboard = UIPasteboard.generalPasteboard()
        self.textView.text = text
        pboard.setValue(text, forPasteboardType: "public.utf8-plain-text")
        dismissViewControllerAnimated(true, completion: nil)
    }
}
// MARK: - UINavigationControllerDelegate
extension ViewController: UINavigationControllerDelegate {
}
