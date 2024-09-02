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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: ARView(
        onARViewCreated: (ARSessionManager arSessionManager, ARObjectManager arObjectManager, ARAnchorManager arAnchorManager, ARLocationManager arLocationManager) async {
          arSessionManager.onInitialize(
            showFeaturePoints: false,
            showPlanes: true,
            customPlaneTexturePath: "assets/triangle.png",
            showWorldOrigin: true,
            handleTaps: true,
          );
          arObjectManager.onInitialize();

          var newNode = ARNode(
            type: NodeType.localGLTF2,
            uri: "assets/Chicken_01/Chicken_01.gltf",
            scale: vector.Vector3(0.2, 0.2, 0.2),
            position: vector.Vector3(0.0, 0.0, 0.0),
            rotation: vector.Vector4(1.0, 1.0, 0.0, 0.0),
          );
          await arObjectManager.addNode(newNode);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
