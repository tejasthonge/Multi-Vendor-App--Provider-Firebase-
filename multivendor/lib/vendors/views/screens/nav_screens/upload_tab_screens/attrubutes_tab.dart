import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multivendor/vendors/controllers/vendor_product_conttroller.dart';
import 'package:provider/provider.dart';

class AttributesTab extends StatefulWidget {
  const AttributesTab({super.key});

  @override
  State<AttributesTab> createState() => _AttributesTabState();
}

class _AttributesTabState extends State<AttributesTab> {
  bool _addedSize = false;
  final TextEditingController _sizeTEC = TextEditingController();
  final List<String> _sizedList = [];

  @override
  Widget build(BuildContext context) {
    VendorProductController _vendorProductController =
        Provider.of<VendorProductController>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              _vendorProductController.getFormData(brandName: value);
            },
            decoration: InputDecoration(
              labelText: 'Brand Name',
            ),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                  child: SizedBox(
                width: 150,
                child: TextFormField(
                  controller: _sizeTEC,
                  decoration: InputDecoration(
                    labelText: 'Size',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _addedSize = true;
                    });
                  },
                ),
              )),
              _addedSize == true
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_sizeTEC.text.trim().isNotEmpty) {
                            _sizedList.add(_sizeTEC.text.toUpperCase());
                            _vendorProductController.getFormData(
                                sizeList: _sizedList);
                          }
                          _sizeTEC.clear();
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.yellow.shade900,
                            borderRadius: BorderRadius.circular(6)),
                        child: true
                            ? Text(
                                "Add",
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
                    )
                  : const SizedBox(),
            ],
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _sizedList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ActionChip(label: Text(_sizedList[index])),
                  );
                }),
          )
        ],
      ),
    );
  }
}
