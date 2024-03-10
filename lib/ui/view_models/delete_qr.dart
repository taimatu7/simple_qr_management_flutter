import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_qr_management_flutter/data/repositories/qr_repository.dart';

final deleteQrProvider =
    Provider((ref) => DeleteQr(ref.read(qrRepositoryProvider)));

class DeleteQr {
  final QrRepository _repository;

  DeleteQr(this._repository);

  Future<bool> execute(String id) async {
    return _repository.delete(id);
  }
}
