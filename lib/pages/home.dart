import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  Order _order = Order();

  String _validateRequired(String value){
    return value.isEmpty? 'Item Required' : null;
  }

  String _validateItemcount (String value){
    //check if the value is not null and convert to integer

    int _valueAsInteger = value.isEmpty? 0 : int.tryParse(value);
    return _valueAsInteger == 0? 'At least one item is required' : null;
  }
  void _submitOrder(){
    if (_formStateKey.currentState.validate()){
      _formStateKey.currentState.save();
      print('Order Item: ${_order.item}');
      print('Order Quantity: ${_order.quantity}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
        //bottom: PopupMenuButtonWidget(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: _formStateKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Espresso',
                        labelText: 'Item',
                      ),
                      onSaved: (value) => _order.item = value,
                      validator: (value) => _validateRequired(value),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: '3',
                        labelText: 'Quantity',
                      ),
                      onSaved: (value) => _order.quantity = int.tryParse(value),
                      validator: (value) => _validateItemcount(value),

                    ),
                    Divider(height: 32.0,),
                    FlatButton(onPressed: () => _submitOrder(), child: Text('Save'), color: Colors.lightBlue,)
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}

class Order{
  String item;
  int quantity;

}
class InputDecoratorsWidget extends StatelessWidget {
  const InputDecoratorsWidget({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 16.0,
          ),
          decoration: InputDecoration(
            labelText: "Notes",
            labelStyle: TextStyle(color: Colors.purple),
            //border: UnderlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple),
            ),
          border: OutlineInputBorder()
          ),
        ),
        Divider(
          color: Colors.lightGreen,
          height: 50.0,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Enter your notes"),
        )
      ],
    );
  }
}

class BoxDecorationWidget extends StatelessWidget {
  const BoxDecorationWidget({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.orange,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              )
            ]),
      ),
    );
  }
}

class ImagesAndIconWidget extends StatelessWidget {
  const ImagesAndIconWidget({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(
          image: AssetImage("assets/images/picture.png"),
          //color: Colors.orange,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 3,
        ),
        Image.network(
          'https://flutter.io/images/catalog-widget-placeholder.png',
          width: MediaQuery.of(context).size.width / 3,
        ),
        Icon(
          Icons.brush,
          color: Colors.lightBlue,
          size: 48.0,
        ),
      ],
    );
  }
}
