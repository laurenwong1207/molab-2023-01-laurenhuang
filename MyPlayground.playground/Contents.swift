import UIKit
import PlaygroundSupport

class TextArtView: UIView {
    private var textView: UITextView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextView()
        displayTextArt()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextView()
        displayTextArt()
    }

    private func setupTextView() {
        textView = UITextView(frame: self.bounds)
        textView.font = UIFont.monospacedSystemFont(ofSize: 5, weight: .regular) // 使用小字体以显示更细致的图案
        textView.isEditable = false
        textView.isSelectable = false
        textView.textAlignment = .center // 文本居中
        addSubview(textView)
    }

    private func displayTextArt() {
        let textArt = generateTextArt()
        textView.text = textArt
    }

    private func generateTextArt() -> String {
        var art = ""
        let size = 21 // 使用奇数尺寸以便居中

        for i in 0..<size {
            for j in 0..<size {
                // Creat shape
                if i==0 || j==0 || i==size-1 || j==size-1{
                    art+="🩵"
                }
                else if(i == size / 2 || j == size / 2 || i == j || size - i - 1 == j || i == 0 || i == size - 1 || j == 0 || j == size - 1 ) {
                    art += "⛄️"
                } else {
                    art += "❄️"
                }
            }
            art += "\n"
        }
        return art
    }
}

// Set the size of the view port
let textArtView = TextArtView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
PlaygroundPage.current.liveView = textArtView

