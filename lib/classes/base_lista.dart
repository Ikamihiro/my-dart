import 'package:cli/classes/base_element.dart';
import 'package:cli/interfaces/base_lista.dart';

class Lista<T> implements BaseLista<T> {
  Element<T> firstElement;
  Element<T> lastElement;

  Lista() {
    firstElement = null;
    lastElement = null;
  }

  int _size = 0;
  int get size => _size;

  @override
  T addElement(T data) {
    var newElement = Element(data);

    var current = firstElement;
    if (firstElement == null) {
      firstElement = newElement;
    } else {
      current = firstElement;
      while (current.next != null) {
        current = current.next;
      }
      current.next = newElement;
    }
    _size++;

    return data;
  }

  @override
  T addElementAt(int position, T data) {
    if (position <= -1 || position >= size) return null;

    var newElement = Element(data);
    if (position == 0) {
      newElement.next = firstElement;
      firstElement = newElement;
      _size++;
      return data;
    }

    var index = 0;
    var previous = firstElement;
    var current = firstElement;
    while (index++ < position) {
      previous = current;
      current = current.next;
    }

    newElement.next = current;
    previous.next = newElement;
    _size++;

    return data;
  }

  @override
  int indexOf(T data) {
    var index = 0;
    var current = firstElement;
    while (current != null) {
      if (current.data == data) return index;

      current = current.next;
      index++;
    }
    return -1;
  }

  @override
  bool isEmpty() => _size == 0;

  @override
  T remove(T data) {
    var index = indexOf(data);
    return removeAt(index);
  }

  @override
  T removeAt(int position) {
    if (position <= -1 || position >= size) return null;

    if (position == 0) {
      var first = firstElement;
      firstElement = first.next;
      _size--;
      return first.data;
    }

    var index = 0;
    var previous = firstElement;
    var current = firstElement;

    while (index++ < position) {
      previous = current;
      current = current.next;
    }

    previous.next = current.next;
    _size--;
    return current.data;
  }

  @override
  void forEach(void Function(T data) f) {
    var index = 0;
    var current = firstElement;
    while (index < size) {
      f(current.data);
      current = current.next;
      index++;
    }
  }
}
