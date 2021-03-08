/**
 * Aeolus : Tweak.x.swift
 *
 * Copyright (c) Monotrix 2020- (https://github.com/Monotrix)
**/

import Orion
import AeolusC
import UIKit

struct CTOR: Tweak {
    init() {
        let bundleID = Bundle.main.bundleIdentifier;
        if (bundleID == "com.apple.springboard") {
            return;
        }
    }
}

class TableViewHook: ClassHook<UIView> {
    static var targetName = "UITableView"
    func setSeparatorStyle(_ style: Int) {
        orig.setSeparatorStyle(0);
    }
}
