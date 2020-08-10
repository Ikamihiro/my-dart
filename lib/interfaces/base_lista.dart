abstract class BaseLista<T> {
  T addElement(T data);
  T addElementAt(int position, T data);
  T removeAt(int position);
  bool isEmpty();
  int indexOf(T data);
  T remove(T data);
  void forEach(void Function(T data) f);
}
