
import UIKit

class FurnitureDetailViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var furniture: Furniture?
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var choosePhotoButton: UIButton!
    @IBOutlet var furnitureTitleLabel: UILabel!
    @IBOutlet var furnitureDescriptionLabel: UILabel!
    
    init?(coder: NSCoder, furniture: Furniture?) {
        self.furniture = furniture
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        guard let furniture = furniture else {return}
        if let imageData = furniture.imageData,
           let image = UIImage(data: imageData) {
            photoImageView.image = image
        } else {
            photoImageView.image = nil
        }
        
        furnitureTitleLabel.text = furniture.name
        furnitureDescriptionLabel.text = furniture.description
    }
    
    @IBAction func choosePhotoButtonTapped(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { (_)
                in imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true)
            })
            alertController.addAction(cameraAction)
            
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { (_) in
                imagePickerController.sourceType = .photoLibrary
                self.present(imagePickerController, animated: true)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    @IBAction func actionButtonTapped(_ sender: Any) {
        guard let image = photoImageView.image else { return }
       
        
        let activityController = UIActivityViewController(activityItems: ["\(furniture?.description)", image], applicationActivities: nil)
        present(activityController, animated: true)
    
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey :Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        
        if let jpegData = selectedImage.jpegData(compressionQuality: 0.9) {
            furniture?.imageData = jpegData
        }
        
        dismiss(animated: true) {
            self.updateView()
        }
    }
}
