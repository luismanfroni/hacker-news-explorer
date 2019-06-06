// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:codexplorer/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:codexplorer/main.dart';

void main() {
    testWidgets('Teste inicialização do APP', (WidgetTester tester) async {
    await tester.pumpWidget(
        App(
            storyRepository: StoryRepository(
                storyApiClient: StoryApiClient(
                    httpClient: http.Client(),
                ),
            )
        )
    );

    // Verifica inicio (lista vazia)
    expect(find.text('Conteúdo vazio'), findsOneWidget);

    // Aperta botão de "novo"
    await tester.tap(find.byIcon(Icons.new_releases));
    await tester.pump();

    // Verifica se esta carregando
    expect(find.text('Conteúdo vazio'), findsNothing);
    });
}
