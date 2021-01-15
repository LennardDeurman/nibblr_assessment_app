typedef FutureInvoker<T> = Future<T> Function();

class FutureBuilderDownloader<T> {

  Future<List<T>> _future;
  Future<List<T>> get future => _future;

  final FutureInvoker<List<T>> futureInvoker;

  FutureBuilderDownloader({ this.futureInvoker });

  Future refresh() {
    _future = this.futureInvoker();
    return _future;
  }

}