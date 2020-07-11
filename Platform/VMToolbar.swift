//
// Copyright © 2020 osy. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import SwiftUI

struct VMToolbar: View {
    var editAction: () -> Void = {}
    @EnvironmentObject private var data: UTMData
    
    #if os(macOS)
    let paddingAmount: CGFloat = 0
    let destructiveButtonColor: Color = .primary
    #else
    let paddingAmount: CGFloat = 10
    let destructiveButtonColor: Color = .red
    #endif
    
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Label("Delete", systemImage: "trash")
                    .foregroundColor(destructiveButtonColor)
                    .labelStyle(IconOnlyLabelStyle())
            }.padding(paddingAmount)
            .help("Delete selected VM")
            Spacer()
            Button {
                
            } label: {
                Label("Clone", systemImage: "doc.on.doc")
                    .labelStyle(IconOnlyLabelStyle())
            }.padding(paddingAmount)
            .help("Clone selected VM")
            Spacer()
            Button {
                
            } label: {
                Label("Share", systemImage: "square.and.arrow.up")
                    .labelStyle(IconOnlyLabelStyle())
            }.padding(paddingAmount)
            .help("Share selected VM")
            Spacer()
            Button {
                data.run(vm: data.selectedVM!)
            } label: {
                Label("Run", systemImage: "play.fill")
                    .labelStyle(IconOnlyLabelStyle())
            }.padding(paddingAmount)
            .help("Run selected VM")
            Spacer()
            Button(action: editAction) {
                Label("Edit", systemImage: "slider.horizontal.3")
                    .labelStyle(IconOnlyLabelStyle())
            }.padding(paddingAmount)
            .help("Edit selected VM")
        }
    }
}

struct VMToolbar_Previews: PreviewProvider {
    static var previews: some View {
        VMToolbar()
    }
}
