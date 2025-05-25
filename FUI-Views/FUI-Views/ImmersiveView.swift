//
//  ImmersiveView.swift
//  FUI-Views
//
//  Created by IVAN CAMPOS on 6/15/24.
//

import SwiftUI
import RealityKit

struct ImmersiveView: View {
    
    fileprivate func addAttachmentToEntity(_ attachments: RealityViewAttachments, attachmentName: String, attachmentPosition: SIMD3<Float>, _ nameEntity: ModelEntity) {
        
        if let attachment = attachments.entity(for: attachmentName) {
            attachment.position = attachmentPosition
            nameEntity.addChild(attachment)
        }
    }
    
    var body: some View {
        RealityView { content, attachments in
            
            let textEntity = ModelEntity(
                mesh: .generateText(futureScape("Immersive FUI"), extrusionDepth: 0.001,
                                    font: UIFont(name: ORBITRON_FONT, size: 0.15) ?? .systemFont(ofSize: 0.15),
                                    containerFrame: .zero,
                                    alignment: .center,
                                    lineBreakMode: .byCharWrapping),
                materials: [UnlitMaterial(color: .black)]
            )
            
            textEntity.position = [0, 2, -1]
            textEntity.name = "name"
            content.add(textEntity)
            
            let attachmentData: [(name: String, position: SIMD3<Float>)] = [
                (name: "ChevronsHorizontal", position: [0.45, -0.1, 0]),
                (name: "CirclePulse", position: [0.87, -0.1, 0]),
            ]
            
            for attachment in attachmentData {
                addAttachmentToEntity(attachments, attachmentName: attachment.name, attachmentPosition: attachment.position, textEntity)
            }
        } attachments: {
            Attachment(id: "ChevronsHorizontal") {
                ChevronsHorizontalView()
                    .frame(width: 800, height: 100)
            }
            Attachment(id: "CirclePulse") {
                CirclePulseView()
                    .frame(width: 400, height: 400)
            }
        }
    }
}
