import 'package:flutter/material.dart';
import 'package:go_sshcli/dao/files_tree_node.dart';

// 文件数组件
class FilesTreeWidget extends StatefulWidget {
  final double leftRatio;
  final double rightTopRatio;
  // final FilesNode nodes;
  FilesTreeWidget({
    Key? key,
    required this.leftRatio,
    required this.rightTopRatio,
  });

  @override
  State<FilesTreeWidget> createState() => _FilesTreeState();
}

class _FilesTreeState extends State<FilesTreeWidget> {
  late double _leftWidthRatio;
  // 创建控制器
  final TextEditingController _fileNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _leftWidthRatio = 0.35;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * (1 - widget.leftRatio);
    double height =
        MediaQuery.of(context).size.height * (1 - widget.rightTopRatio);
    return Container(
      width: width,
      child: Column(
        children: [
          Container(
            width: width,
            height: height * 0.15,
            child: Row(
              children: [
                Container(
                  width: width * 0.6,
                  padding: EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      onSubmitted: (value) {
                        print(_fileNameController.text);
                      },
                      controller: _fileNameController,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        hintText: '请输入文件名称',

                        filled: true,
                        fillColor: Colors.grey.shade300,

                        // 未获得焦点的边框颜色
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // 边框颜色
                          borderRadius: BorderRadius.circular(8.0), // 边框圆角
                        ),

                        // 获得焦点时的边框
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ), // 聚焦时边框颜色和宽度
                          borderRadius: BorderRadius.circular(8.0),
                        ),

                        suffixIcon: GestureDetector(
                          child: Icon(Icons.clear),
                          onTap: () {
                            _fileNameController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
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
                      _leftWidthRatio += details.delta.dx / width;
                      _leftWidthRatio = _leftWidthRatio.clamp(0.2, 0.5);
                    });
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.resizeLeftRight,
                    child: Container(
                      width: 2,
                      color: Colors.grey.shade400,
                      height: height * 0.9,
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
          ),
        ],
      ),
    );
  }
}
