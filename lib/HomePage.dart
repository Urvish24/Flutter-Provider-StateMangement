import 'package:flutter/material.dart';
import 'package:myapp/URisedButton.dart';
import 'package:myapp/provider/counterProvider.dart';
import 'package:myapp/provider/sliderProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _counterprovider;
  var _Sliderprovider;

  @override
  void initState() {
    _counterprovider = Provider.of<counterProvider>(context, listen: false);
    _Sliderprovider = Provider.of<sliderProvider>(context, listen: false);

    print("provider " + _counterprovider.counter.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      URisedButton(title: 'Increament',
                          onTap: () => _counterprovider.incrementCounter()),
                      SizedBox(height: 5,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Consumer<counterProvider>(
                              builder: (context, provider, _) {
                                return Text(provider.counter.toString());
                              }),
                            SizedBox(width: 20,),
                            ElevatedButton(onPressed: () =>
                                _counterprovider.resetCounter(), child: Text('reset'),)
                          ]),
                      SizedBox(height: 5,),
                      URisedButton(title: 'Decreament',
                        onTap: () => _counterprovider.decncrementCounter(),),

                    ],
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
    );
  }


}
