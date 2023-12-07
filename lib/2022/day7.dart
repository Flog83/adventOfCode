class FileSys {
  String name;
  int size;

  FileSys(this.name, this.size);
}

class Directory {
  String name;
  Directory? parent;
  String path;
  Map<String, Directory> dirs = <String, Directory>{};
  Map<String, FileSys> files = <String, FileSys>{};

  Directory(this.name, this.parent, this.path);

  void addDir(String name, Directory dir) {
    dirs.putIfAbsent(name, () => dir);
  }

  void addFile(String name, FileSys file) {
    files.putIfAbsent(name, () => file);
  }

  int dirSize() {
    int localFilesSize = 0;
    if (files.values.isNotEmpty) {
      localFilesSize = files.values
          .map((e) => e.size)
          .reduce((value, element) => value + element);
    }

    int subDir = 0;
    for (Directory value in dirs.values) {
      subDir += value.dirSize();
    }

    return subDir + localFilesSize;
  }
}

String day7_1(List<String> contents) {
  int result = 0;

  bool isCdCmd = false;
  bool isLsCmd = false;

  Directory currentDir = Directory('/', null, '/');
  Map<String, Directory> fileSystem = <String, Directory>{'/': currentDir};
  String currentDirPath = '';
  for (int i = 0; i < contents.length; i++) {
    var line = contents[i];

    if (line.startsWith('\$')) {
      var currentCmd = line.split(' ');
      if (currentCmd.length == 3) {
        // cd cmd
        isCdCmd = true;
        isLsCmd = false;
        var dirToEvaluate = currentCmd[2];
        if (dirToEvaluate == '/') {
          print('cd /');
          // new current dir is / and path /
          currentDir = fileSystem['/']!;
          currentDirPath = '/';
        } else if (dirToEvaluate == '..') {
          print('cd .. from $currentDirPath');
          // Remove Last /XXX in path
          int lastDirIndex = currentDirPath.lastIndexOf('/');
          currentDirPath = currentDirPath.substring(0, lastDirIndex);
          if (currentDirPath.isEmpty) {
            currentDirPath = '/';
          }
          // New current dir is parent from previous
          currentDir = currentDir.parent!;
        } else {
          print('cd $dirToEvaluate');
          if (currentDirPath == '/') {
            currentDirPath += '$dirToEvaluate';
          } else {
            currentDirPath += '/$dirToEvaluate';
          }
          currentDir = fileSystem.putIfAbsent(currentDirPath,
              () => Directory(dirToEvaluate, currentDir, currentDirPath));
        }
        print('current path $currentDirPath');
        print(
            'current dir ${currentDir.name} with parent ${currentDir.parent != null ? currentDir.parent!.name : '/'}');
      } else {
        // ls cmd
        isCdCmd = false;
        isLsCmd = true;
      }
    } else {
      if (isCdCmd) {
        print('ERRRRRRROOOOOORRRRRR');
      } else if (isLsCmd) {
        var currentInfo = line.split(' ');
        if (currentInfo[0] == 'dir') {
          var dirPath;
          if (currentDirPath == '/') {
            dirPath = '/${currentInfo[1]}';
          } else {
            dirPath = '$currentDirPath/${currentInfo[1]}';
          }

          Directory? dirToAdd = fileSystem[dirPath];
          if (dirToAdd == null) {
            dirToAdd = fileSystem.putIfAbsent(
                dirPath, () => Directory(currentInfo[1], currentDir, dirPath));
          }
          currentDir.addDir(currentInfo[1], dirToAdd);
        } else {
          currentDir.addFile(currentInfo[1],
              FileSys(currentInfo[1], int.parse(currentInfo[0])));
        }
      } else {
        print('ERRRRRRROOOOOORRRRRR ++++++++');
      }
    }
  }

  logRecursively(fileSystem['/']!, '-');

  for (Directory value in fileSystem.values) {
    var dirSize = value.dirSize();
    if (dirSize <= 100000) {
      result += dirSize;
    }
  }

  return '$result';
}

void logRecursively(Directory dir, String ident) {
  print('Dir name : ${dir.name}');

  for (var value in dir.files.values) {
    print('File name : ${value.name} / Size :  ${value.size}');
  }

  for (var value in dir.dirs.values) {
    print('Dir child name : ${value.name}');
    logRecursively(value, ident += ident);
  }
}

String day7_2(List<String> contents) {
  int result = 0;

  bool isCdCmd = false;
  bool isLsCmd = false;

  Directory currentDir = Directory('/', null, '/');
  Map<String, Directory> fileSystem = <String, Directory>{'/': currentDir};
  String currentDirPath = '';
  for (int i = 0; i < contents.length; i++) {
    var line = contents[i];

    if (line.startsWith('\$')) {
      var currentCmd = line.split(' ');
      if (currentCmd.length == 3) {
        // cd cmd
        isCdCmd = true;
        isLsCmd = false;
        var dirToEvaluate = currentCmd[2];
        if (dirToEvaluate == '/') {
          print('cd /');
          // new current dir is / and path /
          currentDir = fileSystem['/']!;
          currentDirPath = '/';
        } else if (dirToEvaluate == '..') {
          print('cd .. from $currentDirPath');
          // Remove Last /XXX in path
          int lastDirIndex = currentDirPath.lastIndexOf('/');
          currentDirPath = currentDirPath.substring(0, lastDirIndex);
          if (currentDirPath.isEmpty) {
            currentDirPath = '/';
          }
          // New current dir is parent from previous
          currentDir = currentDir.parent!;
        } else {
          print('cd $dirToEvaluate');
          if (currentDirPath == '/') {
            currentDirPath += '$dirToEvaluate';
          } else {
            currentDirPath += '/$dirToEvaluate';
          }
          currentDir = fileSystem.putIfAbsent(currentDirPath,
              () => Directory(dirToEvaluate, currentDir, currentDirPath));
        }
        print('current path $currentDirPath');
        print(
            'current dir ${currentDir.name} with parent ${currentDir.parent != null ? currentDir.parent!.name : '/'}');
      } else {
        // ls cmd
        isCdCmd = false;
        isLsCmd = true;
      }
    } else {
      if (isCdCmd) {
        print('ERRRRRRROOOOOORRRRRR');
      } else if (isLsCmd) {
        var currentInfo = line.split(' ');
        if (currentInfo[0] == 'dir') {
          var dirPath;
          if (currentDirPath == '/') {
            dirPath = '/${currentInfo[1]}';
          } else {
            dirPath = '$currentDirPath/${currentInfo[1]}';
          }

          Directory? dirToAdd = fileSystem[dirPath];
          if (dirToAdd == null) {
            dirToAdd = fileSystem.putIfAbsent(
                dirPath, () => Directory(currentInfo[1], currentDir, dirPath));
          }
          currentDir.addDir(currentInfo[1], dirToAdd);
        } else {
          currentDir.addFile(currentInfo[1],
              FileSys(currentInfo[1], int.parse(currentInfo[0])));
        }
      } else {
        print('ERRRRRRROOOOOORRRRRR ++++++++');
      }
    }
  }

  int availableSpace = 70000000;
  int updateRequired = 30000000;

  int usedSpace = fileSystem['/']!.dirSize();
  print('used : $usedSpace');

  int neededSpace = updateRequired - (availableSpace - usedSpace);
  print('needed : $neededSpace');

  int minimum = availableSpace;
  String folder = 'noFound';

  for (Directory value in fileSystem.values) {
    var dirSize = value.dirSize();
    if (dirSize >= neededSpace && dirSize <= minimum) {
      minimum = dirSize;
      folder = value.name;
    }
  }

  return '$minimum / $folder';
}
