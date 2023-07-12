import 'package:todo_note_app/data/models/auth_model.dart';
import 'package:todo_note_app/presentation/views/auth/providers/global_auth/global_auth_provider.dart';

abstract class AuthDataSource {
  Future<UserModel> userLogin(String email, String password);
  Future<UserModel> userSignIn(String email, String password, String name, String lastName);

  Future<UserModel> signInWithGoogle();
  Future<UserModel> signInWithFacebook();

  Future<UserModel> getUserModel();
  Future<AuthStatus> checkUserStatus();
  Future<void> sendRecoveryPasswordEmail(String email);
  Future<void> changeUserPassword(String token);
  Future<void> userLogOut();
}
