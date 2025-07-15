import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xterm/xterm.dart';

// 终端组件
class TerminalWidget extends StatefulWidget {
  const TerminalWidget({super.key});

  @override
  State<TerminalWidget> createState() => _TerminalWidgetState();
}

class _TerminalWidgetState extends State<TerminalWidget> {
  late final Terminal terminal;

  @override
  void initState() {
    super.initState();
    _initTerminal();
    // TODO 需要跟后端连调一下
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
      child: TerminalView(terminal, backgroundOpacity: 0),
    );
  }

  void _initTerminal() {
    terminal = Terminal(
      maxLines: 1000,
      onOutput: (String data) {
        print("You typed: $data");
        terminal.write('\u001b[31m红色文本\u001b[0m');
      },
    );
  }
}
