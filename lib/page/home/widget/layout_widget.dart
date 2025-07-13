import 'package:flutter/material.dart';

class HomeLayoutWidget extends StatefulWidget {
  final double width;
  final double height;
  final Widget leftWidget;
  final Widget rightTopWidget;
  final Widget rightBottomWidget;

  const HomeLayoutWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.leftWidget,
    required this.rightTopWidget,
    required this.rightBottomWidget,
  });

  @override
  State<HomeLayoutWidget> createState() => _HomeLayoutWidgetState();
}

class _HomeLayoutWidgetState extends State<HomeLayoutWidget> {
  double _leftRatio = 0.2;
  double _rightTopRatio = 0.7;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Row(
        children: [
          Container(
            width: widget.width * _leftRatio,
            height: widget.height,
            child: widget.leftWidget,
          ),
          // 滑动修改左侧宽度
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                _leftRatio += details.delta.dx / widget.width;
                _leftRatio = _leftRatio.clamp(0.2, 0.5);
              });
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeLeftRight,
              child: Container(
                width: 2,
                height: widget.height,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  width: widget.width * (1 - _leftRatio),
                  height: widget.height * _rightTopRatio,
                  child: widget.rightTopWidget,
                ),
                GestureDetector(
                  onVerticalDragUpdate: (details) {
                    setState(() {
                      _rightTopRatio += details.delta.dy / widget.height;
                      _rightTopRatio = _rightTopRatio.clamp(0.5, 0.7);
                    });
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.resizeUpDown,
                    child: Container(
                      width: widget.width * (1 - _leftRatio),
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                Expanded(child: widget.rightBottomWidget),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
