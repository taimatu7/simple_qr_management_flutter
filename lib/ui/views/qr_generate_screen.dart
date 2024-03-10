import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_qr_management_flutter/ui/extensions/build_context_extension.dart';

class QRGenerateScreen extends ConsumerStatefulWidget {
  const QRGenerateScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      QRGenerateScreenState();
}

class QRGenerateScreenState extends ConsumerState<QRGenerateScreen> {
  late Future<void> _initFunction;

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
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'QRコードに変換する文字',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    context.showCircularProgressIndicator(
                        Future.delayed(const Duration(seconds: 2), () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('QRコードを生成しました'),
                        ),
                      );
                    }));
                  },
                  child: const Text('QRコードを生成する'),
                ),
              ],
            );
          }),
    );
  }
}
