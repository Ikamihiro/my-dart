class Element<T> {
  T data;
  Element next;

  Element(this.data);

  @override
  String toString() {
    return 'Element: {$data}';
  }
}
