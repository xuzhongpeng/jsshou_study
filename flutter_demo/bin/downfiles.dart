// // import 'package:path_provider/path_provider.dart';
// import 'package:dio/dio.dart';
// import 'package:archive/archive.dart';
// import 'package:archive/archive_io.dart';
// import "dart:io";
// import "dart:convert";

// // loadFiles("http://192.168.1.26:8080/h5.zip");
// class DownFiles {
//   Future<String> loadFiles(String loadUrl,
//       {String type, String version = '0.0.1'}) async {
//     // String dir =(await getApplicationDocumentsDirectory()).path;
//     String dir = Directory.current.path + "/bin";
//     String zipName = loadUrl.substring(loadUrl.lastIndexOf('/') + 1);
//     String fileDirectory = zipName.substring(0, zipName.lastIndexOf('.'));
//     File file = await new File(dir + "/$zipName").create();
//     Dio dio = new Dio();
//     await dio.download(loadUrl, file.path);
//     List<int> bytes = File(file.path).readAsBytesSync();
//     // Decode the Zip file
//     Archive archive = ZipDecoder().decodeBytes(bytes);
//     Directory newDirectory = Directory(dir + "/$fileDirectory/");
//     if (newDirectory.existsSync()) {
//       newDirectory.deleteSync(recursive: true);
//     }
//     for (ArchiveFile file in archive) {
//       String filename = file.name;
//       if (file.isFile) {
//         List<int> data = file.content;
//         File(dir + "/$fileDirectory/" + filename)
//           ..createSync(recursive: true)
//           ..writeAsBytesSync(data);
//       } else {
//         Directory(dir + "/$fileDirectory/" + filename)..create(recursive: true);
//       }
//     }
//     //version 写入
//     File versionFile = File(dir + "/version.json");
//     if (!versionFile.existsSync()) {
//       versionFile.createSync();
//       Map<String, dynamic> versionJson = {
//         type: {"version": version, "fileName": fileDirectory}
//       };
//       versionFile.writeAsStringSync(jsonEncode(versionJson));
//     } else {
//       Map<String, dynamic> versionJson = {};
//       try {
//         versionJson = jsonDecode(versionFile.readAsStringSync());
//       } catch (e) {}
//       if (versionJson[type] != null) {
//         String oldFileName = versionJson[type]["fileName"];
//         Directory oldD = new Directory(dir + "/$oldFileName");
//         if (oldD.existsSync()) {
//           oldD.deleteSync(recursive: true);
//         }
//       }
//       Map<String, String> newVersion = {
//         "version": version,
//         "fileName": fileDirectory
//       };
//       versionJson[type] = newVersion;
//       print(versionJson.toString());
//       versionFile.writeAsStringSync(jsonEncode(versionJson));
//     }
//     file.deleteSync(); //删除zip文件
//     String url = dir + "/$fileDirectory";
//     print("********* download path: " + url);
//     return url;
//   }

//   String getVersion(String type) {
//     try {
//       String dir = Directory.current.path + "/bin";
//       File versionFile = File(dir + "/version.json");
//       Map<String, dynamic> versionJson =
//           jsonDecode(versionFile.readAsStringSync());
//       return versionJson[type]['version'];
//     } catch (e) {
//       return null;
//     }
//   }
// }
