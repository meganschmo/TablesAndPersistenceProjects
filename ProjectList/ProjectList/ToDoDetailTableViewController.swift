//
//  ToDoDetailTableViewController.swift
//  ProjectList
//
//  Created by Megan Schmoyer on 11/6/23.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var expirationDateLabel: UILabel!
    @IBOutlet weak var expirationDatePicker: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var isDatePickerHidden = true
    let dateLabelIndexPath = IndexPath(row: 0, section: 1)
    let datePickerIndexPath = IndexPath(row: 1, section: 1)
    let notesIndexPath = IndexPath(row: 0, section: 2)
    
    var toDo: ToDo?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let currentExpirationDate: Date
        if let toDo = toDo {
            navigationItem.title = "To-Do"
            titleTextField.text = toDo.title
            isCompleteButton.isSelected = toDo.wasEaten
            currentExpirationDate = toDo.expirationDate
            notesTextView.text = toDo.notes
        } else {
            currentExpirationDate = Date().addingTimeInterval(24*60*60)
        }
        expirationDatePicker.date = currentExpirationDate
        updateExpirationDateLabel(date: expirationDatePicker.date)
        updateSaveButtonState()
    }
    func updateSaveButtonState() {
        let shouldEnableSaveButton = titleTextField.text?.isEmpty ==
           false
        saveButton.isEnabled = shouldEnableSaveButton
    }
    func updateExpirationDateLabel(date: Date) {
        expirationDateLabel.text = date.formatted(.dateTime.month(.defaultDigits).day().year(.twoDigits).hour().minute())
    }

    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected.toggle()
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateExpirationDateLabel(date: sender.date)
    }
    override func tableView(_ tableView: UITableView,
       heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datePickerIndexPath where isDatePickerHidden == true:
            return 0
        case notesIndexPath:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datePickerIndexPath:
            return 216
        case notesIndexPath:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == dateLabelIndexPath {
            isDatePickerHidden.toggle()
            updateExpirationDateLabel(date: expirationDatePicker.date)
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveUnwind" else { return }
        
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let expirationDate = expirationDatePicker.date
        let notes = notesTextView.text
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
         if toDo != nil {
                toDo?.title = title
             toDo?.wasEaten = isComplete
                toDo?.expirationDate = expirationDate
                toDo?.notes = notes
            } else {
                toDo = ToDo(title: title, wasEaten: isComplete, expirationDate: expirationDate, notes: notes)
            }
      
    }
 

}
