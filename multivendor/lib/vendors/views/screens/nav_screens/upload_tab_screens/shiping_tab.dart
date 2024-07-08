

import 'package:flutter/material.dart';
import 'package:multivendor/vendors/controllers/vendor_product_conttroller.dart';
import 'package:provider/provider.dart';

class ShippingTab extends StatefulWidget {
  const ShippingTab({super.key});

  @override
  State<ShippingTab> createState() => _ShippingTabState();
}

class _ShippingTabState extends State<ShippingTab> {
  bool _chargeShipping = false;
  double _shippingCharge = 0;

  @override
  Widget build(BuildContext context) {
    VendorProductController _vendorProductController = Provider.of<VendorProductController>(context);

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CheckboxListTile(
            
            
            title: Text("Charge Shipping"),
            value: _chargeShipping, 
            onChanged: (value){
            setState(() {
              _chargeShipping = value!;
              _vendorProductController.getFormData(chargeShipping: _chargeShipping);
              if (!_chargeShipping) {
                _vendorProductController.getFormData(shippongCharge: 0);
              }
            });
          },
          
          ),
        ),
        _chargeShipping == true ?
        Padding(
      padding: EdgeInsets.symmetric(horizontal: 17),

          child: TextFormField( 
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Shipping Charge",
            ),
            onChanged: (value) {
              _shippingCharge = double.parse(value);

              _vendorProductController.getFormData(shippongCharge:_shippingCharge );
            },
            
          
          ),
        ) : const SizedBox()
      ],
    );
  }
}