import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'categoryModel.dart';

class CategoryController with ChangeNotifier{
  bool _isCategoryLoading = false;
  bool get isCategoryLoading =>_isCategoryLoading;

  bool _isAddCategoryLoading = false;
  bool get isAddCategoryLoading =>_isAddCategoryLoading;

  List<CategoryModel> _allCategories=[];
  List<CategoryModel> get allCategories => _allCategories ;

getCategories()async{
  await Firebase.initializeApp();
  _isCategoryLoading=true;
  notifyListeners();

  FirebaseFirestore.instance.collection('categories').get().then((QuerySnapshot shot) => shot.docs.forEach((element) {
    final CategoryModel _newCategory= CategoryModel(
      id: element.id,
      categoryName: element["categoryName"],
      categoryImage: element["categoryImage"]
    );
    _allCategories.add(_newCategory);
  }));
  _isCategoryLoading=false;
  notifyListeners();
}

add(String categoryName,String categoryImage)async{
  await Firebase.initializeApp();
  _isAddCategoryLoading=true;
  notifyListeners();
  Map<String,dynamic> _data={
    'categoryName':categoryName,
    'categoryImage':categoryImage
  };
  FirebaseFirestore.instance.collection('categories').add(_data);

  _isAddCategoryLoading=false;
  notifyListeners();
}

}