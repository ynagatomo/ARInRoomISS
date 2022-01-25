//
//  ARSpaceView.swift
//  arinroomiss
//
//  Created by Yasuhito NAGATOMO on 2022/01/25.
//

import SwiftUI
import RealityKit
import ARKit

struct ARSpaceView: UIViewRepresentable {
    let modelName = "InRoomISS.usdz"

    func makeUIView(context: Context) -> some UIView {
        let arView = ARView(frame: .zero)

        let anchorEntity = AnchorEntity()
        arView.scene.addAnchor(anchorEntity)

        do {
            let modelEntity = try Entity.load(named: modelName)
            anchorEntity.addChild(modelEntity)
        } catch {
            assertionFailure("could not load assets.")
        }

        let config = ARWorldTrackingConfiguration()
        arView.session.run(config)

        return arView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
