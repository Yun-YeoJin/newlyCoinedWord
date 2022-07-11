
import UIKit

class ViewController: UIViewController {

    var newlyWordDic: [String: String] = ["만반잘부": "만나서 잘 부탁해",
                        "꾸안꾸": "꾸민듯 안꾸민듯",
                        "낄끼빠빠": "낄 때 끼고 빠질 때 빠져라",
                        "솔까말": "솔직히 까놓고 말해서",
                        "얼죽아": "얼어죽어도 아이스 아메리카노",
                        "자낳괴": "자본주의가 낳은 괴물",
                        "자만추": "자연스러운 만남 추구",
                        "이왜진": "이게 왜 진짜야"]
    
    @IBOutlet weak var SearchBar: UITextField!
    @IBOutlet weak var SearchButton: UIButton!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    
    
    @IBOutlet weak var resultSearch: UILabel!
    
    
    @IBOutlet var newlycoinedButtonCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        buttonDesign(firstButton, "만반잘부")
        buttonDesign(secondButton, "꾸안꾸")
        buttonDesign(thirdButton, "낄끼빠빠")
        buttonDesign(fourthButton, "솔까말")
        
        searchBarDesign()
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
    
    // 검색창 Design 설정
    func searchBarDesign() {
        SearchBar.placeholder = "신조어를 입력해주세요."
        SearchBar.borderStyle = .bezel
    }
    
    // 검색 결과창 Design 설정
    func labelDesign() {
        resultSearch.text = "신조어 검색 결과"
        resultSearch.font = UIFont.boldSystemFont(ofSize: 20)
        resultSearch.textColor = UIColor.blue
        resultSearch.textAlignment = .center
    }
    
//    func SearchWords() {
//        if SearchBar.text == "만반잘부" {
//            resultSearch.text = newlyWordDic["만반잘부"]
//        }   else if SearchBar.text == "솔까말"{
//            resultSearch.text = newlyWordDic["솔까말"]
//        } else if SearchBar.text == "꾸안꾸"{
//            resultSearch.text = newlyWordDic["꾸안꾸"]
//    }  else if SearchBar.text == "낄끼빠빠"{
//        resultSearch.text = newlyWordDic["낄끼빠빠"]
//    } else {
//        resultSearch.text = "신조어 사전에 없는 단어입니다!"
//        resultSearch.textColor = .red
//    }
//
//    }
    
    // 올라와있는 키보드 내리기
    @IBAction func keyBoardDown(_ sender: Any) {
        view.endEditing(true)
    }
    
    // search버튼 클릭시
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        if !(SearchBar.text?.isEmpty)! {
            resultSearch.text = newlyWordDic[SearchBar.text!]
        }
        let coinedWord = newlyWordDic.keys.shuffled()
        for (button, word) in zip(newlycoinedButtonCollection, coinedWord) {
            button.setTitle(word, for: .normal)
        }
    }
   
    // Did End on Exit로 설정 , return키 누르면 키보드 내려감.
    @IBAction func keyBoardDownForReturn(_ sender: UITextField) {
        searchButtonClicked(SearchButton)
        // SearchWords()
    }
    
    
}
