import 'package:flutter/material.dart';

import '../controllers/cidades_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CidadeController _cidadeController = CidadeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: Listenable.merge(
                    [_cidadeController.cidades, _cidadeController.loading]),
                builder: (_, __) {
                  return _cidadeController.loading.value
                      ? const CircularProgressIndicator()
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _cidadeController.cidades.value.length,
                          itemBuilder: (context, index) => ListTile(
                            title: Text(
                                _cidadeController.cidades.value[index].nome),
                          ),
                        );
                },
              ),
              ElevatedButton.icon(
                onPressed: () => _cidadeController.callAPI(),
                icon: const Icon(Icons.location_city),
                label: const Text("RN"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
