import 'package:flutter/material.dart';
import 'package:go_sshcli/dao/files_tree_node.dart';

// 文件数组件
class FilesTreeWidget extends StatefulWidget {
  // final FilesNode nodes;
  FilesTreeWidget({Key? key});

  @override
  State<FilesTreeWidget> createState() => _FilesTreeState();
}

class _FilesTreeState extends State<FilesTreeWidget> {
  double _leftWidthRatio = 0.35;
  late double width;
  late double height;

  @override
  void initState() {
    super.initState();
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.blue),
            width: width * _leftWidthRatio,
            child: Center(child: Text('文件树')),
          ),
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                _leftWidthRatio = details.delta.dx / width;
                _leftWidthRatio = _leftWidthRatio.clamp(0.2, 0.5);
              });
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeLeftRight,
              child: Container(
                width: 2,
                color: Colors.grey.shade400,
                height: height,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.red),
              child: Center(child: Text('文件列表')),
            ),
          ),
        ],
      ),
    );
  }
}
