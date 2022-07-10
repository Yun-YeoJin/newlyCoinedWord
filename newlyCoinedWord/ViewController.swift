
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SearchBar: UITextField!
    @IBOutlet weak var SearchButton: UIButton!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    
    @IBOutlet weak var resultSearch: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        buttonDesign(firstButton, "만반잘부")
        buttonDesign(secondButton, "꾸안꾸")
        buttonDesign(thirdButton, "낄낄빠빠")
        buttonDesign(fourthButton, "솔까말")
        
        labelDesign()
        
    }
    
    //각 버튼 Design 함수 설정
    func buttonDesign(_ buttonNumber: UIButton, _ buttonName: String) {
        buttonNumber.setTitle(buttonName, for: .normal)
        buttonNumber.setTitleColor(.black, for: .normal)
        buttonNumber.titleLabel?.font = .systemFont(ofSize: 15)
        buttonNumber.layer.cornerRadius = 8
        buttonNumber.layer.borderWidth = 2
        buttonNumber.layer.borderColor = UIColor.darkGray.cgColor
        buttonNumber.clipsToBounds = true
        


}
    
    func labelDesign() {
        resultSearch.text = "신조어 검색 결과"
        resultSearch.font = UIFont.boldSystemFont(ofSize: 20)
        resultSearch.textColor = UIColor.blue
        resultSearch.textAlignment = .center
    }
    //올라와있는 키보드 내리기
    @IBAction func keyBoardDown(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        resultSearch.text = SearchBar.text
    }
    
    @IBAction func keyBoardDownForReturn(_ sender: UITextField) {
        resultSearch.text = SearchBar.text
    }
    
    
}
