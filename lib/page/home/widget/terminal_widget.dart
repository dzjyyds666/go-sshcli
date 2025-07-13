import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 终端组件
class TerminalWidget extends StatefulWidget {
  const TerminalWidget({super.key});

  @override
  State<TerminalWidget> createState() => _TerminalWidgetState();
}

class _TerminalWidgetState extends State<TerminalWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // 在当前帧渲染完成后再执行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'), // 将图片放到assets目录
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.9), // 设置透明度遮罩
            BlendMode.darken, // 调整颜色混合模式
            /*
              BlendMode	作用简述	应用场景举例
              BlendMode.darken	两层中较暗的像素值为准	图片变暗（文字好看）
              BlendMode.lighten	两层中较亮的像素值为准	图片提亮
              BlendMode.multiply	底图和颜色混合（类似 Photoshop 乘法）	增强对比度或染色
              BlendMode.overlay	叠加图层（暗的更暗，亮的更亮）	典型图像叠加效果
              BlendMode.color	保留亮度，替换颜色	染色，用于风格变换
              BlendMode.srcATop	保留背景形状，用颜色遮罩	遮罩型染色
             */
          ),
        ),
      ),
      child: ListView(
        // 默认滚动到最下面,不是反向输出
        controller: _scrollController,
        children: [
          for (var i = 0; i < 130; i++)
            Container(
              child: Text(
                '$i',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white, // 确保文字可见
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
