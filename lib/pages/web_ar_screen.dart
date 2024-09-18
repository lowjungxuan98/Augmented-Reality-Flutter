import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class WebARScreen extends StatefulWidget {
  const WebARScreen({super.key});

  @override
  State<WebARScreen> createState() => _WebARScreenState();
}

class _WebARScreenState extends State<WebARScreen> {
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
            type: NodeType.webGLB,
            uri: "https://github.com/KhronosGroup/glTF-Sample-Models/blob/main/2.0/Duck/glTF-Binary/Duck.glb?raw=true",
            scale: Vector3(0.2, 0.2, 0.2),
            position: Vector3(0.0, 0.0, 0.0),
            rotation: Vector4(1.0, 0.0, 0.0, 0.0),
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
