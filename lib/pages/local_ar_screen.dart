import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class LocalARScreen extends StatefulWidget {
  const LocalARScreen({super.key});

  @override
  State<LocalARScreen> createState() => _LocalARScreenState();
}

class _LocalARScreenState extends State<LocalARScreen> {
  ARObjectManager? arObjectManager;
  ARNode? node;
  double rotationAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: GestureDetector(
        onPanUpdate: (details) {
          _onPan(details);
        },
        child: ARView(
          onARViewCreated: (ARSessionManager arSessionManager, ARObjectManager arObjectManager, ARAnchorManager arAnchorManager, ARLocationManager arLocationManager) async {
            arSessionManager.onInitialize(
              showFeaturePoints: false,
              showPlanes: true,
              customPlaneTexturePath: "assets/triangle.png",
              showWorldOrigin: true,
              handleTaps: true,
            );
            this.arObjectManager = arObjectManager;
            arObjectManager.onInitialize();

            node = ARNode(
              type: NodeType.localGLTF2,
              uri: "assets/Chicken_01/Chicken_01.gltf",
              scale: vector.Vector3(0.2, 0.2, 0.2),
              position: vector.Vector3(0.0, 0.0, 0.0),
              rotation: vector.Vector4(0.0, 1.0, 0.0, rotationAngle),
            );
            await arObjectManager.addNode(node!);
          },
        ),
      ),
    );
  }

  void _onPan(DragUpdateDetails details) async {
    double deltaRotation = details.delta.dx * (3.14159 / 180);
    setState(() {
      rotationAngle += deltaRotation;
    });

    if (node != null && arObjectManager != null) {
      await arObjectManager!.removeNode(node!);

      node = ARNode(
        type: NodeType.localGLTF2,
        uri: "assets/Chicken_01/Chicken_01.gltf",
        scale: vector.Vector3(0.2, 0.2, 0.2),
        position: vector.Vector3(0.0, 0.0, 0.0),
        rotation: vector.Vector4(0.0, 1.0, 0.0, rotationAngle),
      );

      await arObjectManager!.addNode(node!);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
