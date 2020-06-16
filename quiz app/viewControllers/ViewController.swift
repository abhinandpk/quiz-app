//
//  ViewController.swift
//  quiz app
//
//  Created by MacBook on 16/06/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var questionCollectionView: UICollectionView!
    
    let const = Constants()
    var answerList = [AnyObject]()


    override func viewDidLoad() {
        super.viewDidLoad()
        quizList()
        // Do any additional setup after loading the view.
    }
         func quizList() {
              // Activity indicator
     //         activityIndicator.center =  CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2)
     //         self.view.addSubview(activityIndicator)
     //        activityIndicator.color = self.const.activityIndColor
     //         self.activityIndicator.startAnimating()
        
     AF.request(const.baseUrl+"api.php?amount=10&difficulty=easy",method: .get , parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON
          {
          response in
          switch response.result {
          case let .success(datavalue):
             let data = datavalue as AnyObject
             let status = data.value(forKey: "response_code") as! Int
             if status == 0 {
             let Categories = data.value(forKey: "results") as! [AnyObject]
                for categoriesList in Categories {
                let category = categoriesList["category"]as! String
                let question = categoriesList["question"]as! String
                let type = categoriesList["type"]as! String
                let correctAnswer = categoriesList["correct_answer"]as! String
                var IncorrectAnswers = categoriesList["incorrect_answers"]as! [String]
                IncorrectAnswers.append(correctAnswer)
                let options = IncorrectAnswers
                    let questionData = Qestion(category: category, type: type, question: question, answer: correctAnswer, options: options )
              questionDetails.append(questionData)
                self.questionCollectionView.reloadData()
    
              

                 }
             }
              print(datavalue)
          case let .failure(error):
              print(error)
          }

          }
          }
    
    @objc func btn1selection(_ sender: checkUIButton) {
        
        let button = sender as? UIButton
        let cell = button?.superview?.superview as? QuestionCollectionViewCell
        if let image = UIImage(named: "green_radius") {
            cell?.optionbtn1.setImage(image, for: .normal)
            let image =  UIImage(named: "radius")
            cell?.optionbtn2.setImage(image, for: .normal)
            cell?.optionbtn3.setImage(image, for: .normal)
            cell?.optionbtn4.setImage(image, for: .normal)
            
        }

        let ans1 = sender.correctAnswer
        let checkAns1 = sender.selectedAnswer
        if ans1 == checkAns1 {
            let alert = UIAlertController(title: "Alert", message: "Your Answer is  correct", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else  {
            let alert = UIAlertController(title: "Alert", message: "\("Your a wrong the answer is ")\(ans1)", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @objc func btn2selection(_ sender: checkUIButton) {
        
        let button = sender as? UIButton
        let cell = button?.superview?.superview as? QuestionCollectionViewCell
        if let image = UIImage(named: "green_radius") {
            cell?.optionbtn2.setImage(image, for: .normal)
            let image =  UIImage(named: "radius")
            cell?.optionbtn1.setImage(image, for: .normal)
            cell?.optionbtn3.setImage(image, for: .normal)
            cell?.optionbtn4.setImage(image, for: .normal)
            
        }
     
        let ans1 = sender.correctAnswer
        let checkAns1 = sender.selectedAnswer
        if ans1 == checkAns1 {
            let alert = UIAlertController(title: "Alert", message: "Your Answer is  correct", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else  {
            let alert = UIAlertController(title: "Alert", message: "\("Your a wrong the answer is ")\(ans1)", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @objc func btn3selection(_ sender: checkUIButton) {
        
        let button = sender as? UIButton
        let cell = button?.superview?.superview as? QuestionCollectionViewCell
        if let image = UIImage(named: "green_radius") {
            cell?.optionbtn3.setImage(image, for: .normal)
            let image =  UIImage(named: "radius")
            cell?.optionbtn1.setImage(image, for: .normal)
            cell?.optionbtn2.setImage(image, for: .normal)
            cell?.optionbtn4.setImage(image, for: .normal)
            
        }
        let ans1 = sender.correctAnswer
        let checkAns1 = sender.selectedAnswer
        if ans1 == checkAns1 {
            let alert = UIAlertController(title: "Alert", message: "Your Answer is  correct", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else  {
            let alert = UIAlertController(title: "Alert", message: "\("Your a wrong the answer is ")\(ans1)", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @objc func btn4selection(_ sender: checkUIButton) {
        
        let button = sender as? UIButton
        let cell = button?.superview?.superview as? QuestionCollectionViewCell
        let indexPath = questionCollectionView.indexPath(for: cell!)
        if let image = UIImage(named: "green_radius") {
            cell?.optionbtn4.setImage(image, for: .normal)
            let image =  UIImage(named: "radius")
            cell?.optionbtn1.setImage(image, for: .normal)
            cell?.optionbtn2.setImage(image, for: .normal)
            cell?.optionbtn3.setImage(image, for: .normal)
            
        }
        let ans1 = sender.correctAnswer
        let checkAns1 = sender.selectedAnswer
        if ans1 == checkAns1 {
            let alert = UIAlertController(title: "Alert", message: "Your Answer is  correct", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else  {
            let alert = UIAlertController(title: "Alert", message: "\("Your a wrong the answer is ")\(ans1)", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

}


 struct Qestion: Codable {
     let category: String
     let type: String
     let question: String
     let answer: String
     let options: [String]
}
var questionDetails = [Qestion]()

extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionDetails.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCollectionViewCell", for: indexPath) as! QuestionCollectionViewCell
        cell.categoryName.text = questionDetails[indexPath.row].category
        cell.questionsLb.text = questionDetails[indexPath.row].question
        cell.optionalAns1.text = questionDetails[indexPath.row].answer
        cell.optionalAns1.text = questionDetails[indexPath.row].options[0]
        cell.optionalAns2.text = questionDetails[indexPath.row].options[1]
        cell.optionbtn1.selectedAnswer = questionDetails[indexPath.row].options[0]
        cell.optionbtn2.selectedAnswer = questionDetails[indexPath.row].options[1]

        let types = questionDetails[indexPath.row].type
        if types == "boolean" {
            cell.optionalAns3.isHidden = true
            cell.optionalAns4.isHidden = true
            cell.optionbtn3.isHidden = true
            cell.optionbtn4.isHidden = true

        }
        else {
            cell.optionalAns3.isHidden = false
            cell.optionalAns4.isHidden = false
            cell.optionbtn3.isHidden = false
            cell.optionbtn4.isHidden = false
            cell.optionalAns3.text = questionDetails[indexPath.row].options[2]
            cell.optionalAns4.text = questionDetails[indexPath.row].options[3]
            cell.optionbtn3.selectedAnswer = questionDetails[indexPath.row].options[2]
            cell.optionbtn4.selectedAnswer = questionDetails[indexPath.row].options[3]
        }
         cell.optionbtn1.tag = indexPath.row
         cell.optionbtn2.tag = indexPath.row
        cell.optionbtn3.tag = indexPath.row
        cell.optionbtn4.tag = indexPath.row
         cell.optionbtn1.sectioncount = indexPath.section
         cell.optionbtn2.sectioncount = indexPath.section
         cell.optionbtn3.sectioncount = indexPath.section
         cell.optionbtn4.sectioncount = indexPath.section
        cell.optionbtn1.correctAnswer = questionDetails[indexPath.row].answer
        cell.optionbtn2.correctAnswer = questionDetails[indexPath.row].answer
        cell.optionbtn3.correctAnswer = questionDetails[indexPath.row].answer
        cell.optionbtn4.correctAnswer = questionDetails[indexPath.row].answer

        cell.optionbtn1.addTarget(self, action: #selector(btn1selection), for: .touchUpInside)
        cell.optionbtn2.addTarget(self, action: #selector(btn2selection), for: .touchUpInside)
        cell.optionbtn3.addTarget(self, action: #selector(btn3selection), for: .touchUpInside)
        cell.optionbtn4.addTarget(self, action: #selector(btn4selection), for: .touchUpInside)

        return cell
    }


}
