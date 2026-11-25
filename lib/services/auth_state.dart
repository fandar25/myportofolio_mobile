import 'package:flutter/foundation.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

/// Holds the in-memory authentication token for the current session.
class AuthState extends ChangeNotifier {
  AuthState(this._apiClient, {String? initialToken}) : _token = initialToken;

  final ApiClient _apiClient;
  String? _token;

  String? get token => _token;
  bool get isLoggedIn => _token != null;

  Future<void> login(String username, String password) async {
    _token = await _apiClient.obtainToken(username, password);
    notifyListeners();
  }

  Future<void> logout() async {
    final currentToken = _token;
    if (currentToken == null) return;

    try {
      await _apiClient.logout(token: currentToken);
    } on ApiException {
      // Clear the local session even if the server rejects the token.
    } catch (_) {
      // Clear the local session even if the server cannot be reached.
    } finally {
      _token = null;
      notifyListeners();
    }
  }
}
