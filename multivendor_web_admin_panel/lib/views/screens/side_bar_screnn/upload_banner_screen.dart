
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UploadBannerSceen extends StatefulWidget {
  const UploadBannerSceen({super.key});
  static  const String routeName ='/UploadBannerSceen';

  @override
  State<UploadBannerSceen> createState() => _UploadBannerSceenState();
}

class _UploadBannerSceenState extends State<UploadBannerSceen> {
  dynamic _image;
  String? _imageName;
  final FirebaseStorage _firebaseStorage =FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //following funtion is for peack the image form the local storgae
  pickImage()async{
    FilePickerResult? result =await FilePicker.platform.pickFiles(type: FileType.image,allowMultiple: false);
    if( result !=null){
     setState(() {
        _image = result.files.first.bytes;
        _imageName= result.files.first.name;
     });
    }
  }

  //following funtion to store the image pecked form local storage in the Firebase storage

  _uploadImgaeToFirebaseStore({required dynamic image})async{
    Reference ref =  _firebaseStorage.ref().child("Banners").child(_imageName!);
    UploadTask uploadTask =  ref.putData(image);
    TaskSnapshot snapshot =  await uploadTask;
    String imageUrl= await snapshot.ref.getDownloadURL();
    return imageUrl;
  }


  //following fun to store the imgeurl in firbase firestore

  Future _uploadImageURlToFirebaseFireStore()async{
    if(_image !=null){
     String imageUrl= await _uploadImgaeToFirebaseStore(image: _image);

    _firestore.collection("Banners").doc(_imageName).set(
      {
        "image":imageUrl
      }
    );
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(9),
              alignment: Alignment.topLeft,
              child: Text("Banners",
                style: TextStyle( 
                  fontSize:36,
                fontWeight:FontWeight.w700
                ),
              ),
            ),
            Divider(
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
                          border: Border.all(color:Colors.grey.shade900),
                          borderRadius: BorderRadius.circular(10)
              
                        ),
                        child: 
                        _image !=null ?
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.memory(_image,
                            fit: BoxFit.cover,
                          )
                          
                        ):
                        Center(child: Text(" Banners",
                        
                        )),
                      ),

                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle( 
                          
                              backgroundColor: MaterialStateProperty.all(Colors.yellow.shade900)
                            ),
                            onPressed: (){
                              pickImage();
                            }, child: Text("Upload Banners",
                              style: TextStyle(color: Colors.white),
                            )),
                             const SizedBox(width: 20,),
                   ElevatedButton( 
                        style: ButtonStyle( 

                          backgroundColor: MaterialStateProperty.all(Colors.green)
                        ),
                        onPressed: (){
                          _uploadImageURlToFirebaseFireStore().whenComplete((){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Banner Uploadded Sussesfully "))
                            );
                          });
                        }, child: Text("Save",
                          style: TextStyle(color: Colors.white),
                        ))
                        ],
                      )
                    ],
                  ),
                 
                ],
              ),
            )
          ],
        ),
      ));
  }
}