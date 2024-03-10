import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_qr_management_flutter/data/models/qr.dart';
import 'package:simple_qr_management_flutter/data/repositories/qr_repository.dart';

final getQrProvider = Provider((ref) => GetQr(ref.read(qrRepositoryProvider)));

class GetQr {
  final QrRepository _repository;

  GetQr(this._repository);

  Future<Qr?> execute(String text) async {
    return _repository.find(text);
  }
}
