import 'dart:async';

class AppEventBus {
  final _controller = StreamController<void>.broadcast();

  Stream<void> get onLanguageChange => _controller.stream;

  void notifyLanguageChange() {
    _controller.add(null);
  }

  void dispose() {
    _controller.close();
  }
}