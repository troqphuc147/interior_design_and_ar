import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/size_config.dart';
import 'package:vector_math/vector_math_64.dart';

class ARViewScreen extends StatefulWidget {
  final String linkAR;
  const ARViewScreen({Key? key, required this.linkAR}) : super(key: key);
  @override
  _ARView createState() => _ARView();
}

class _ARView extends State<ARViewScreen> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  late ARAnchorManager arAnchorManager;

  List<ARNode> nodes = [];
  List<ARAnchor> anchors = [];

  @override
  void dispose() {
    super.dispose();
    arSessionManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        ARView(
          onARViewCreated: onARViewCreated,
          planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
        ),
        Align(
          alignment: FractionalOffset.topLeft,
          child: Padding(
            padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(20),
                getProportionateScreenWidth(16), 0, 0),
            child: SizedBox(
              width: getProportionateScreenWidth(40),
              height: getProportionateScreenWidth(40),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: kTextColor1,
                  size: getProportionateScreenWidth(20),
                ),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(left: getProportionateScreenWidth(8)),
                  shape: const CircleBorder(),
                  primary: kPrimaryColor,
                  backgroundColor: const Color(0xFFEBECF1),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(180),
              margin: EdgeInsets.only(bottom: getProportionateScreenWidth(20)),
              decoration: BoxDecoration(
                color: kSelectedButtonColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                  onTap: onRemoveEverything,
                  child: Center(
                    child: Text(
                      "Remove Everything",
                      style: TextStyle(
                          color: kTextColor3,
                          fontWeight: FontWeight.w600,
                          fontSize: getProportionateScreenWidth(16)),
                    ),
                  )),
            ),
          ]),
        )
      ])),
    );
  }

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    this.arAnchorManager = arAnchorManager;

    this.arSessionManager.onInitialize(
          showFeaturePoints: false,
          showPlanes: true,
          customPlaneTexturePath: "Images/triangle.png",
          showWorldOrigin: true,
        );
    this.arObjectManager.onInitialize();

    this.arSessionManager.onPlaneOrPointTap = onPlaneOrPointTapped;
    this.arObjectManager.onNodeTap = onNodeTapped;
  }

  Future<void> onRemoveEverything() async {
    /*nodes.forEach((node) {
      this.arObjectManager.removeNode(node);
    });*/
    anchors.forEach((anchor) {
      arAnchorManager.removeAnchor(anchor);
    });
    anchors = [];
  }

  Future<void> onNodeTapped(List<String> nodes) async {
    var number = nodes.length;
    arSessionManager.onError("Tapped $number node(s)");
  }

  Future<void> onPlaneOrPointTapped(
      List<ARHitTestResult> hitTestResults) async {
    var singleHitTestResult = hitTestResults.firstWhere(
        (hitTestResult) => hitTestResult.type == ARHitTestResultType.plane);
    if (singleHitTestResult != null) {
      var newAnchor =
          ARPlaneAnchor(transformation: singleHitTestResult.worldTransform);
      bool didAddAnchor =
          await arAnchorManager.addAnchor(newAnchor) == true ? true : false;
      if (didAddAnchor) {
        anchors.add(newAnchor);
        // Add note to anchor
        var newNode = ARNode(
            type: NodeType.webGLB,
            uri: widget.linkAR,
            scale: Vector3(1, 1, 1),
            position: Vector3(0.0, 0.0, 0.0),
            rotation: Vector4(1.0, 0.0, 0.0, 0.0));
        bool didAddNodeToAnchor =
            await arObjectManager.addNode(newNode, planeAnchor: newAnchor) ==
                    true
                ? true
                : false;
        if (didAddNodeToAnchor) {
          nodes.add(newNode);
        } else {
          arSessionManager.onError("Adding Node to Anchor failed");
        }
      } else {
        arSessionManager.onError("Adding Anchor failed");
      }
    }
  }
}
