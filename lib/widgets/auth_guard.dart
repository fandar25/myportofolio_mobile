import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/login_screen.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:provider/provider.dart';

/// Opens [LoginScreen] when the current user has not authenticated yet.
Future<bool> ensureLoggedIn(BuildContext context) async {
  if (context.read<AuthState>().isLoggedIn) return true;

  final loggedIn = await Navigator.of(context)
      .push<bool>(MaterialPageRoute<bool>(builder: (_) => const LoginScreen()));
  return loggedIn ?? false;
}
