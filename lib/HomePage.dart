import 'package:flutter/material.dart';
import 'package:myapp/URisedButton.dart';
import 'package:myapp/provider/counterProvider.dart';
import 'package:myapp/provider/sliderProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<counterProvider>(
      create:  (_) => counterProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Consumer<counterProvider>(
                builder: (context, provider, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      URisedButton(title: 'Increament',onTap: ()=> provider.incrementCounter()),
                      SizedBox(height: 5,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(provider.counter.toString()),
                            SizedBox(width: 20,),
                            ElevatedButton(onPressed: ()=>provider.resetCounter(),child: Text('reset'),)]),
                            SizedBox(height: 5,),
                            URisedButton(title: 'Decreament',onTap: ()=> provider.decncrementCounter(),),

                    ],
                  );
                }
              ),
              Consumer<sliderProvider>(
                  builder: (context, provider, _) {
                    return Column(
                      children: [
                        SizedBox(height: 20,),
                        Text(provider.getSlidervalue.round().toString()),
                        Slider(
                          min: 0,
                          max: 100,
                          value: provider.value,
                          onChanged: (value) {
                            provider.sliderChange(value);
                          },
                        ),
                      ],
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    final _store = Provider.of<counterProvider>(context, listen: false);

    print("provider "+_store.counter.toString());
  }
}
