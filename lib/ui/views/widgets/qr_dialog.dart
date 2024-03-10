import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:simple_qr_management_flutter/ui/view_models/delete_qr.dart';

class QrDialog extends ConsumerWidget {
  const QrDialog({Key? key, required this.id, required this.data})
      : super(key: key);

  final String data;
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(data),
      content: SizedBox(
          width: 200,
          height: 200,
          child: Center(child: QrImageView(data: data))),
      actions: [
        TextButton(
          onPressed: () async {
            await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('削除'),
                    content: const Text('削除しますか？'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text('キャンセル'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await ref
                              .read(deleteQrProvider)
                              .execute(id)
                              .then((value) {
                            if (value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('削除しました')));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('削除に失敗しました')));
                            }
                          });
                          if (context.mounted) Navigator.pop(context, true);
                        },
                        child: const Text('削除'),
                      ),
                    ],
                  );
                }).then((value) {
              if (value as bool) Navigator.pop(context);
            });
          },
          child: const Text('削除'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('閉じる'),
        ),
      ],
    );
  }
}
