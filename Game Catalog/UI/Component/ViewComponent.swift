//
//  ViewComponent.swift
//  Game Catalog
//
//  Created by Danang Wijaya on 11/08/21.
//

import Foundation
import SwiftUI

extension View{
    @ViewBuilder func isHidden(_ isHidden: Bool)-> some View{
        if(isHidden){
            self.hidden()
        }else{
            self
        }
    }
}
