import 'dart:io';

import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

final String Function(String) getFileNameFromPath =
    (path) => path.split('/').last;

final MultipartFile Function(File) fileToMultipartFile = (file) {
  final _fileName = file.path.split('/').last;
  final _extension = _fileName.split('.')[1] ?? 'jpg';
  return MultipartFile.fromBytes(_fileName, file.readAsBytesSync(),
      filename: _fileName, contentType: MediaType('image', _extension));
};
