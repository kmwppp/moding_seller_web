import 'dart:typed_data';

class SellerProfileEditFile {
  const SellerProfileEditFile({required this.fileName, required this.bytes});

  final String fileName;
  final Uint8List bytes;
}
