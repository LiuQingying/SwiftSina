//
//  JMHomeCell.swift
//  SwiftSina
//
//  Created by 营 on 2017/7/23.
//  Copyright © 2017年 营. All rights reserved.
//

import UIKit
import SnapKit

class JMHomeCell: UITableViewCell {
    lazy var headerButton = UIButton()
    lazy var nickLabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "id")
        self.selectionStyle = .none
        setupSubViews()
    }
    private func setupSubViews(){
        addSubview(headerButton)
        headerButton.backgroundColor = UIColor.red
        headerButton.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(10)
            make.width.height.equalTo(50)
        }
        headerButton.rx
        addSubview(nickLabel)
        nickLabel.backgroundColor = UIColor.red
        nickLabel.snp.makeConstraints { (make) in
            make.left.equalTo(headerButton.snp.right).offset(5)
            make.top.equalTo(headerButton.snp.top)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(20)
        }
    }
    public func setmodel(model :JMHomeModel){
        nickLabel.text = model.author
        headerButton.kf.setImage(with: URL(string: model.authorportrait), for: .normal)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
