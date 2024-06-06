//streams
Stream<int> boatStream() async*{
  for (var i = 0; i <=10; i++) {
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

void main() async{
  Stream<int> stream = boatStream();

  stream.listen((receivedData) {
    print("Recieved boat number "+receivedData.toString());
  });
}