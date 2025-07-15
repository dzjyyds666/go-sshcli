import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_sshcli/page/home/widget/files_tree.dart';
import 'package:go_sshcli/page/home/widget/layout_widget.dart';
import 'package:go_sshcli/page/home/widget/terminal_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: HomeLayoutWidget(
        width: width,
        height: height,
        leftWidget: Container(decoration: BoxDecoration(color: Colors.red),child: Center(child: Text('leftSideBar',style: TextStyle(fontSize: 20.sp),))),
        rightTopWidget: TerminalWidget(),
        rightBottomWidget: FilesTreeWidget(),
      ),
    );
  }
}
