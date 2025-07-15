// 文件树的结构
// TODO 兼容windows
class FilesNode {
  final String name; // 文件名
  final String fileType; // 是否为文件夹
  final String permissions; // 权限字符串，例如 "drwxr-xr-x@"
  final int links; // 硬链接数
  final String owner; // 所有者
  final String group; // 用户组
  final String sizeHuman; // 人类可读的大小（如 "1.4K"）
  final String modified; // 修改时间
  final String? rawLine; // 原始 ls 输出（可选）
  List<FilesNode> nodes; // 子节点

  FilesNode({
    required this.name,
    required this.fileType,
    required this.permissions,
    required this.links,
    required this.owner,
    required this.group,
    required this.sizeHuman, // 文件大小
    required this.modified, // 修改时间
    this.rawLine,
    this.nodes = const [],
  });

  @override
  String toString() {
    return 'FilesNode(name: $name, fileType: $fileType, permissions: $permissions, links: $links, owner: $owner, group: $group, sizeHuman: $sizeHuman, modified: $modified, rawLine: $rawLine, nodes: $nodes)';
  }   

  // 根据unix的文件结构创建文件节点
  static FilesNode newFilesNodeWithUnix(String reuslt) {
    List<String> list = reuslt.split(' ');
    String permission = list[0];
    int links = int.parse(list[1]);
    String owner = list[2];
    String group = list[3];
    String sizeHuman = list[4];
    String modified = '${list[5]}-${list[6]} ${list[7]}';
    return FilesNode(
      permissions: permission,
      links: links,
      owner: owner,
      group: group,
      sizeHuman: sizeHuman,
      modified: modified,
      name: list[8],
      fileType: getFileType(permission),
      rawLine: reuslt,
    );
  }

  static String getFileType(String permissionField) {
    if (permissionField.isEmpty) return 'unknown';

    switch (permissionField[0]) {
      case '-':
        return 'file'; // 普通文件
      case 'd':
        return 'directory'; // 目录
      case 'l':
        return 'symlink'; // 符号链接
      case 'c':
        return 'char device'; // 字符设备
      case 'b':
        return 'block device'; // 块设备
      case 's':
        return 'socket';
      case 'p':
        return 'pipe (FIFO)';
      default:
        return 'unknown';
    }
  }

  void addNodes(FilesNode node) {
    nodes.add(node);
  }

  void resetNodes(List<FilesNode> newNodes) {
    nodes.clear();
    for (var node in newNodes) {
      nodes.add(node);
    }
  }
}
