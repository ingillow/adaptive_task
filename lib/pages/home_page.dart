import 'package:adaptive_task/pages/error_text_widget.dart';
import 'package:adaptive_task/provider/provider_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContentProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Scrollbar(
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              Scrollable.ensureVisible(context);
            },
            child: SingleChildScrollView(
              primary: true,
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await provider.getRandomCharacterName();
                    },
                    child: const Text('Get Name'),
                  ),
                  Consumer<ContentProvider>(
                    builder: (context, imageProvider, _) {
                      if (imageProvider.name.isNotEmpty) {
                        return Text(imageProvider.name);
                      } else if (imageProvider.hasError) {
                        return const ErrorTextWidget();
                      }
                      return Container();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await provider.getRandomImageCharacter();
                    },
                    child: const Text('Get Image'),
                  ),
                  Consumer<ContentProvider>(
                    builder: (context, imageProvider, _) {
                      if (imageProvider.image.isNotEmpty) {
                        return Image.network(imageProvider.image);
                      } else if (imageProvider.hasError) {
                        return const ErrorTextWidget();
                      }
                      return Container();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await provider.getRandomSpeciesCharacter();
                    },
                    child: const Text('Get Spices'),
                  ),
                  Consumer<ContentProvider>(
                    builder: (context, imageProvider, _) {
                      if (imageProvider.species.isNotEmpty) {
                        return Text(imageProvider.species);
                      } else if (imageProvider.hasError) {
                        return const ErrorTextWidget();
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}