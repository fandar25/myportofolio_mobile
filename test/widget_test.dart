import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('Adding a project asks for login and validates credentials', (
    WidgetTester tester,
  ) async {
    final apiClient = ApiClient(
      client: MockClient((_) async => http.Response('[]', 200)),
    );
    await tester.pumpWidget(MyApp(apiClient: apiClient));

    expect(find.text('MyPortfolio'), findsOneWidget);

    await tester.tap(find.text('Tambah Proyek'));
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsWidgets);
    await tester.tap(find.text('Login').first);
    await tester.pumpAndSettle();

    expect(find.text('Username tidak boleh kosong.'), findsOneWidget);
    expect(find.text('Password tidak boleh kosong.'), findsOneWidget);
  });
}
