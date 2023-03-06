part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
  static const auth = _Paths.auth;
  static const createTask = _Paths.createTask;
}

abstract class _Paths {
  _Paths._();
  static const home = '/home';
  static const auth = '/auth';
  static const createTask = '/create-task';
}
