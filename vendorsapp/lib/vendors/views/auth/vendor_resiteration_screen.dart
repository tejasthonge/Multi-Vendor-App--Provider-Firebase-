import 'dart:developer';

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vendorsapp/vendors/controllers/vendor_registretion_conttroller.dart';

class VendorResigistrationScreen extends StatefulWidget {
  const VendorResigistrationScreen({super.key});

  @override
  State<VendorResigistrationScreen> createState() =>
      _VendorResigistrationScreenState();
}

class _VendorResigistrationScreenState
    extends State<VendorResigistrationScreen> {
  late String _stateValue;
  late String _cityValue;
  late String _countryValue;
  String? _selecteTaxOption;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _businessNameTEC = TextEditingController();
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _phoneTEC = TextEditingController();
  final TextEditingController _taxNoTEC = TextEditingController();
  // late String addressValue;
  final VendorResigistrationController _vendorResigistrationController =
      VendorResigistrationController();
  Uint8List? _image;
  selectGallaryImage({
    required BuildContext context,
  }) async {
    Uint8List im = await _vendorResigistrationController.pickStorImage(
        context: context, source: ImageSource.gallery);

    setState(() {
      _image = im;
    });
  }

  selectCameraImage({
    required BuildContext context,
  }) async {
    Uint8List im = await _vendorResigistrationController.pickStorImage(
        context: context, source: ImageSource.camera);

    setState(() {
      _image = im;
    });
  }

  final List<String> _taxOptionList = [
    "YES",
    "NO",
  ];

  _addVendndorsDatat({required VendorResigistrationController vendorResigistrationController }) async {
String res ='All fileds must be filled ';
  EasyLoading.show();
    if(_formKey.currentState!.validate() && _image != null ){
     res= await vendorResigistrationController.registedVendroData(
        context: context,
        businessName: _businessNameTEC.text.trim(),
        phone: _phoneTEC.text.trim(),
        email: _emailTEC.text.trim(),
        taxNo: _taxNoTEC.text.trim(),
        city: _cityValue,
        state: _stateValue,
        country: _countryValue,
        selecteTaxOption: _selecteTaxOption!,
        image: _image).whenComplete(() {
           EasyLoading.showSuccess("Vendors Data registered successfully!");
           _image = null;
           _businessNameTEC.clear();
           _emailTEC.clear();
           _phoneTEC.clear();
           _taxNoTEC.clear();
           _cityValue = '';
           _stateValue = '';
           _countryValue = '';
           _selecteTaxOption = null;
           setState(() {
             
           });
        });
       

    }else{
      EasyLoading.showError("Something is wrong");
    }
    EasyLoading.dismiss();
   
  log(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<VendorResigistrationController>(
          builder: (context, vendorResigistrationController, child) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
                toolbarHeight: 200,
                backgroundColor: Colors.pink,
                flexibleSpace: LayoutBuilder(builder: ((context, constraints) {
                  return FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Colors.yellow.shade900,
                        Colors.yellow,
                      ])),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: _image == null
                                  ? IconButton(
                                      onPressed: () {
                                        selectGallaryImage(context: context);
                                      },
                                      icon: Icon(CupertinoIcons.photo),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.memory(
                                        _image!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }))),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _businessNameTEC,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: "Business Name",
                        ),
                        validator: (value){
                          if (value!.isEmpty) {
                            return 'Please enter Business Name';
                          }
                          return null;

                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _emailTEC,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email Address",
                        ),
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Please enter Email Address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _phoneTEC,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: "Phone Number",
                        ),
                        validator: (value){
                          if (value!.isEmpty) {
                            return 'Please enter phone no';
                          }
                          return null;}
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SelectState(
                        onCountryChanged: (value) {
                          setState(() {
                            _countryValue = value;
                          });
                        },
                        onStateChanged: (value) {
                          setState(() {
                            _stateValue = value;
                          });
                        },
                        onCityChanged: (value) {
                          setState(() {
                            _cityValue = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Tax Registered ?",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          const Spacer(),
                          Flexible(
                            child: DropdownButtonFormField(
                                hint: Text("Select"),
                                items: _taxOptionList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value, child: Text(value));
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selecteTaxOption = value!;
                                  });
                                }),
                          ),
                        ],
                      ),
                      _selecteTaxOption == "YES"
                          ? TextFormField(
                              controller: _taxNoTEC,
                              decoration: InputDecoration(
                                labelText: "Tax Number",
                              ),
                              validator: (value){
                          if (value!.isEmpty) {
                            return 'Please enter Please enter a tax number';
                          }
                          return null;}
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          _addVendndorsDatat(vendorResigistrationController: vendorResigistrationController);
                        },
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.yellow.shade900),
                          child:
                              vendorResigistrationController.getLodding == false
                                  ? const Text(
                                      "Save",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : const Center(
                                      child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
