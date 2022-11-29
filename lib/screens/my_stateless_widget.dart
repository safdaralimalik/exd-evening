import 'package:flutter/material.dart';
class MyStatelessWidget extends StatefulWidget{
   MyStatelessWidget({super.key});

  @override
  State<MyStatelessWidget> createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  int count=10;

  void incrementCount(){

    setState(() {
      count=count+1;
    });
    print(count);
  }

  @override
  void initState() {
    if(mounted==true){
      setState(() {

      });
    }
    print("initState called");
    super.initState();

  }


  @override
  void didChangeDependencies() {
    print("didChangeDependencies called");
    super.didChangeDependencies();

  }
  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(
      body: Center(
        child: RichText(
          text:  TextSpan(
            text: 'Hello',
            style: TextStyle(

            ),
            children: [
              const TextSpan(
                text: 'Your count is: ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14
                ),
              ),
              TextSpan(
                text: '$count',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )
              ),
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCount,
        child: const Text("+",style: TextStyle(fontSize: 20)),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant MyStatelessWidget oldWidget) {
    print("didUpdateWidget called");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print("deactivate called");
    super.deactivate();
  }
  @override
  void dispose() {
    print("dispose called");
    super.dispose();
  }
}