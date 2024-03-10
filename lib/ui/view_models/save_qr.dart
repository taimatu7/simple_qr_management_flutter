import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_qr_management_flutter/data/repositories/qr_repository.dart';

final saveQrProvider =
    Provider((ref) => SaveQr(ref.read(qrRepositoryProvider)));

class SaveQr {
  final QrRepository _repository;

  SaveQr(this._repository);

  Future<bool> execute(String text) async {
    return _repository.save(text);
  }
}
