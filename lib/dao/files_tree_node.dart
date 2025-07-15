// 文件树的结构
// TODO 兼容windows
class FilesTreeNode {
  String name; // 文件名
  String path; // 文件路径
  String size; // 文件大小
  String permission; // 文件权限
  String owner; // 文件所有者
  String time; // 文件修改时间
  String month; // 文件修改时间
  String day; // 文件修改时间
  String staff; // 用户组
  bool isDir; // 是否是目录
  List<FilesTreeNode> children; // 子节点
  FilesTreeNode(
    this.name,
    this.path,
    this.isDir,
    this.children,
    this.size,
    this.permission,
    this.owner,
    this.time,
    this.month,
    this.day,
    this.staff,
  );

  static FilesTreeNode? newFileTreeNode(String result) {
    List<String> resultArry = result.split(' ');
    // return FilesTreeNode();
    return null;
  }
}
