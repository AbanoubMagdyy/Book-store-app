import 'package:book_store/Features/home/presentation/views/library_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/book_model.dart';
import '../../../data/models/filter_chip_model.dart';
import '../../views/home_screen.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeCurrentIndex(int index) {
    currentIndex = index;
    theListIWant = books.where((book) {
      return book.category.contains('Technology');
    }).toList();

    emit(ChangeCurrentIndex());
  }

  int currentScreen = 0;

  changeSlider(int value) {
    currentScreen = value;
    preparingChips();
    preparingTheListIWant(value);
    emit(ChangeSlider());
  }

  void preparingTheListIWant(int value) {
    if (value == 0) {
      theListIWant = books.where((book) {
        return book.category.contains('Technology');
      }).toList();
    } else {
      theListIWant = books.where((book) {
        return book.library.contains('Maktabet El-Shorouk');
      }).toList();
    }
  }

  List<Widget> screens = [
    const HomeScreen(),
    const LibraryScreen(),
  ];

  List<BookModel> books = [];
  Future<void> getBooks() async {
    emit(LoadingGetBooks());
    await FirebaseFirestore.instance
        .collection('Books')
        .get()
        .then((value) async {
      for (var element in value.docs) {
        books.add(BookModel.fromJson(element.data()));
      }
      bookFilters();
      preparingPopularBooks();
      emit(SuccessGetBooks());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorGetBooks());
    });
  }

  List<String> categories = [];
  List<String> libraries = [];
  void bookFilters() {
    for (var i in books) {
      categories.add(i.category);
      libraries.add(i.library);
    }
    categories = categories.toSet().toList();
    libraries = libraries.toSet().toList();
    preparingChips();
  }

  List<FilterChipModel> chips = [];

  void selectChip(int index) {
    for (int i = 0; i < chips.length; i++) {
      if (i == index) {
        chips[i].isSelected = true;
      } else {
        chips[i].isSelected = false;
      }
    }
    emit(SelectChip());
  }

  void preparingChips() {
    if (currentScreen == 0) {
      chips = categories
          .map((item) => FilterChipModel(name: item, isSelected: false))
          .toList();
      chips[0].isSelected = true;
    } else {
      chips = libraries
          .map((item) => FilterChipModel(name: item, isSelected: false))
          .toList();
      chips[0].isSelected = true;
    }
    emit(SelectChip());
  }

  List<BookModel> popularBooks = [];

  void preparingPopularBooks() {
    popularBooks = List.from(books);
    popularBooks.shuffle();
  }

  List<BookModel> cart = [];
  void addToCart(BookModel bookModel) {
    cart.add(bookModel);
    emit(AddToCart());
  }

  List<BookModel> theListIWant = [];
  void theListIWantMethod(item) {
    theListIWant = books.where((book) {
      return book.category.contains(item) || book.library.contains(item);
    }).toList();
  }

  bool search = false;

  void activeSearch() {
    search = true;
    emit(ActiveSearch());
  }

  void deactivatedSearch() {
    search = false;
    emit(DeactivatedSearch());
  }

  List<BookModel> searchResult = [];

  void findTheBook(String query) {
    searchResult = [];
    searchResult = books.where((book) {
      return book.title.contains(query) ||
          book.title.contains(query.toUpperCase()) ||
          book.title.contains(query.toLowerCase());
    }).toList();
    emit(SuccessSearchBook());
  }
}
