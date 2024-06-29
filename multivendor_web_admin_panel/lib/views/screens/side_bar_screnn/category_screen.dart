

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multivendor_web_admin_panel/views/screens/side_bar_screnn/widgets/category_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  static const String routeName = '/CategoryScreen';

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  dynamic _image;
  String? _imageName;
  String? _categoryName;
  final TextEditingController _cattegoryTEC = TextEditingController();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  _peackImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowCompression: true,
          allowMultiple: false, type: FileType.image);
    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
        _imageName = result.files.first.name;
      });
    } else {}
  }

  _uploadCategoryImagesToStorage(dynamic image) async {
    Reference ref = _storage.ref().child("Category").child(_imageName!);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }

  uploadCategory() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show();
      String imageUrl = await _uploadCategoryImagesToStorage(_image);
      await _firebaseFirestore
          .collection("Category")
          .doc(_imageName)
          .set({"image": imageUrl, "categoryName": _categoryName}).whenComplete(() {
             EasyLoading.showSuccess(
        "Category : ' $_categoryName' is  added successfully!"
      );
      EasyLoading.dismiss();
      setState(() {
        _image = null;
        _formKey.currentState!.reset();
      });
          });
     
    } else {
      print("bad");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SingleChildScrollView(
            child: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(9),
              alignment: Alignment.topLeft,
              child: const Text(
                "Category",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            border: Border.all(color: Colors.grey.shade900),
                            borderRadius: BorderRadius.circular(10)),
                        child: _image != null
                            ? Image.memory(
                                _image,
                                fit: BoxFit.cover,
                              )
                            : const Center(
                                child: Text(
                                "Category",
                              )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.yellow.shade900)),
                          onPressed: () {
                            _peackImage();
                          },
                          child: const Text(
                            "Upload Category",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                  Flexible(
                    child: SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: _cattegoryTEC,
                        decoration: const InputDecoration(
                            hintText: "Enter Category Name",
                            labelText: 'Enter Category Name'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Category name is not Empty please Enter Name";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          _categoryName = value;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      onPressed: () {
                        uploadCategory();
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
            Divider( color: Colors.grey,),
            Container( 
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              width:double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              ),),
            const CategoryWidget()

          ],
        ),
      ),
    )));
  }
}
