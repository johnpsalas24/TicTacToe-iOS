import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var statusLabel: UILabel!
    
    var currentPlayer = "X"
    var board = Array(repeating: "", count: 9)
    
    let winningCombinations: [[Int]] = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let tag = sender.tag - 1
        
        if board[tag] == "" {
            board[tag] = currentPlayer
            sender.setTitle(currentPlayer, for: .normal)
            
            if checkForWinner() {
                statusLabel.text = "Player \(currentPlayer) wins!"
                disableAllButtons()
            } else {
                togglePlayer()
            }
        }
    }
    
    func togglePlayer() {
        currentPlayer = (currentPlayer == "X") ? "O" : "X"
        statusLabel.text = "Player \(currentPlayer)'s turn"
    }
    
    func checkForWinner() -> Bool {
        for combination in winningCombinations {
            if board[combination[0]] == currentPlayer &&
               board[combination[1]] == currentPlayer &&
               board[combination[2]] == currentPlayer {
                return true
            }
        }
        return false
    }
    
    func disableAllButtons() {
        for button in buttons {
            button.isEnabled = false
        }
    }
}
