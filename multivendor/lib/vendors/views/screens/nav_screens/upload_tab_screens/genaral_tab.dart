import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:multivendor/vendors/controllers/vendor_product_conttroller.dart';
import 'package:provider/provider.dart';

class GeneralTab extends StatefulWidget {
  const GeneralTab({super.key});

  @override
  State<GeneralTab> createState() => _GeneralTabState();
}

class _GeneralTabState extends State<GeneralTab> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _productNameTEC = TextEditingController();

  final TextEditingController _productPriseTEC = TextEditingController();

  final TextEditingController _proquctQuantityTEC = TextEditingController();

  String _selectedProductCategory ='';

  final TextEditingController _productDiscriptionTEC = TextEditingController();

   List<String> _productCategoryList = <String>[];
   String? sheduledDate;

   FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;


  String _formateDate(date){

    final formate= DateFormat('dd/MM/yyyy');
    return formate.format(date);
  }

   _getCategourys()async{

    return _firebaseFirestore.collection("Category").get().then((QuerySnapshot querySnapshot) {

      querySnapshot.docs.forEach((doc) { 

        setState(() {
          _productCategoryList.add(doc["categoryName"]);
        });
      });
    });

   }

   @override
  void initState() {
    _getCategourys().whenComplete((){
      print(_productCategoryList);
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    VendorProductController _vendorProductController = Provider.of<VendorProductController>(context);
    return Padding(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _productNameTEC,
                onChanged: (value) {
                  _vendorProductController.getFormData(productName: value);
                },
                decoration: InputDecoration(labelText: "Enter product name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter product name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _productPriseTEC,
                onChanged: (value) {
                  _vendorProductController.getFormData(productPrice: double.parse(value));
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Enter product Price"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter product price";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _proquctQuantityTEC,
                onChanged: (value) {
                  _vendorProductController.getFormData(productQuantity: int.parse(value));
                },
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Enter product Quantity"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter product Quantity";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              
              
              DropdownButtonFormField(
                hint: Text("Select Product Category"),


                items:_productCategoryList.map<DropdownMenuItem<String>>((e){
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),

              onChanged: ((value){
                _vendorProductController.getFormData(productCategory: value);

                _selectedProductCategory = value! ;
              })
              
              ),

              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _productDiscriptionTEC,
                onChanged: (value) {
                  _vendorProductController.getFormData(productDescription: value); //
                },
                keyboardType: TextInputType.text,
                maxLines: 4,
                maxLength: 800,
                
                decoration:
                    InputDecoration(
                      border: OutlineInputBorder( 
                        borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: "Enter product Discreption"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter product Discreption";
                  }
                  return null;
                },
              ),

              Row(
                children: [
                  TextButton(
                    onPressed: ()async{
                  
                      
                      await showDatePicker(      
                      context: context, firstDate: DateTime.now(), lastDate: DateTime(5000)).then((value) {
                        sheduledDate = _formateDate(value);
                         _vendorProductController.getFormData(productShceduleDate: _formateDate(value));
                         
                      });
                      
                      setState(() {});
                  },
                   child: Text("Shedule")),
                  sheduledDate !=null ?
                  // Text(sheduledDate.toString().substring(0,10)) :Text("")
                  Text(
                    sheduledDate as String,
                    style: TextStyle(color: Colors.red),
                  )
                  :
                  Text(""),


                ],
              ),
              GestureDetector(
                onTap: (){
                  print(_vendorProductController.productData.toString()) ;
                  print(sheduledDate);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 30,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.yellow.shade900,
                      borderRadius: BorderRadius.circular(6)),
                  child: true
                      ? Text(
                          "Save product",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
