#### 积累UI合集
> Label中部分可以加点击事件

```
    @IBOutlet weak var mTouchLabel: TouchLabel!
    @IBOutlet weak var mMsgLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "label部分文字可以点击"
        setupDemoUI()
    }

    func setupDemoUI()
    {
        let desFontSize = CGFloat(18)
        let defaultStyle = [NSForegroundColorAttributeName: color(170, green: 170, blue: 170), NSFontAttributeName: UIFont.systemFont(ofSize: desFontSize)]
        let attrString = NSMutableAttributedString(string: "您可以点击后面的蓝色文字", attributes: defaultStyle)
        attrString.append(NSMutableAttributedString(string: "点我啊", attributes: [NSForegroundColorAttributeName: color(20, green: 130, blue: 240), NSFontAttributeName: UIFont.systemFont(ofSize: desFontSize)]))
        mTouchLabel.attributedText = attrString
        mTouchLabel.addEvent("点我啊", callback: { [weak self] in
            self?.mMsgLabel.text = "点击蓝色文字"
        })
    }

```
