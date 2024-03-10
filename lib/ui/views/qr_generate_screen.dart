import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:simple_qr_management_flutter/ui/extensions/build_context_extension.dart';

class QRGenerateScreen extends ConsumerStatefulWidget {
  const QRGenerateScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      QRGenerateScreenState();
}

class QRGenerateScreenState extends ConsumerState<QRGenerateScreen> {
  late Future<void> _initFunction;
  final TextEditingController _textEditingController = TextEditingController();
  bool isGenerated = false;
  Future<void> _init() async {}

  @override
  void initState() {
    super.initState();
    _initFunction = _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR生成'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: FutureBuilder(
          future: _initFunction,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              const CircularProgressIndicator();
            }

            return Column(
              children: [
                const SizedBox(height: 20),
                const Text('QRコードに変換する文字を入力してください'),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'QRコードに変換する文字',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final FocusScopeNode currentScope = FocusScope.of(context);
                    if (!currentScope.hasPrimaryFocus &&
                        currentScope.hasFocus) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    }
                    // TODO 入力したデータを保存する
                    await context.showCircularProgressIndicator(
                        Future.delayed(const Duration(seconds: 2), () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('QRコードを生成しました'),
                        ),
                      );
                    }));
                    // TODO 成功か失敗かを戻り値として取得して使用する
                    setState(() {
                      isGenerated = true;
                    });
                  },
                  child: const Text('QRコードを生成する'),
                ),
                const SizedBox(height: 20),
                isGenerated
                    ? SizedBox(
                        width: 200,
                        height: 200,
                        child: QrImageView(data: _textEditingController.text))
                    : const SizedBox(),
              ],
            );
          }),
    );
  }
}
