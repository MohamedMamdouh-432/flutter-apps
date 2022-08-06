import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _curIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    List<Widget> PagesList = [
    GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10.0,
      childAspectRatio: 0.6,
      children: [
        GestureDetector(
          child: Card(
            child: Column(
              children: [
                const Text('Amoxicillin'),
                Image.asset(
                  'images/amox.jpg', 
                  height: 180,
                ),
                const Text('Amoxicillin is used to treat bacterial infections')
              ]
            )
          ),
        ),
        GestureDetector(
          child: Card(
            child: Column(
              children: [
                const Text('Vitamin D'),
                Image.asset(
                  'images/vitamin.jpg', 
                  height: 180,
                ),
                const Text('Vitamin D is used to treat and prevent vitamin D deficiency.')
              ]
            )
          ),
        ),
        GestureDetector(
          
          child: Card(
            child: Column(
              children: [
                const Text('Aspirin'),
                Image.asset(
                  'images/asprin.jpg', 
                  height: 180,
                ),
                const Text('Aspirin is used to reduce fever and relieve mild to moderate pain from conditions such as muscle')
              ]
            )
          ),
        ),
        GestureDetector(
          
          child: Card(
            child: Column(
              children: [
                const Text('Antinal'),
                Image.asset(
                  'images/antinal.jpg', 
                  height: 180,
                ),
                const Text('Antinal is used to treat diarrhea and Intestinal gastroesophageal reflux disease')
              ]
            )
          ),
        ),
        GestureDetector(
          
          child: Card(
            child: Column(
              children: [
                const Text('Atenol'),
                Image.asset(
                  'images/atenol.jpg', 
                  height: 180,
                ),
                const Text('Atenol is used to treat high blood pressure (hypertension)')
              ]
            )
          ),
        ),
        GestureDetector(
          
          child: Card(
            child: Column(
              children: [
                const Text('Baclofen'),
                Image.asset(
                  'images/baclofen.jpg', 
                  height: 180,
                ),
                const Text('Baclofen is used to treat pain and certain types of spasticity')
              ]
            )
          ),
        ),
        GestureDetector(
          
          child: Card(
            child: Column(
              children: [
                const Text('Melatonin'),
                Image.asset(
                  'images/melatonin.jpg', 
                  height: 180,
                ),
                const Text('Melatonin is used to treat sleep problems in people aged 55 and over')
              ]
            )
          ),
        ),
        GestureDetector(
          
          child: Card(
            child: Column(
              children: [
                const Text('Phenytoin'),
                Image.asset(
                  'images/phenytoin.jpg', 
                  height: 180,
                ),
                const Text('Phenytoin is used to  control certain type of seizures and to treat and prevent seizures')
              ]
            )
          ),
        ),
        GestureDetector( 
          
          child: Card(
            child: Column(
              children: [
                const Text('Sodium Valproate'),
                Image.asset(
                  'images/sodium.jpg', 
                  height: 180,
                ),
                const Text('Sodium Valproate is used to prevents epileptic seizures by reducing excessive electrical activity in your brain')
              ]
            )
          ),
        ),
        GestureDetector(
          
          child: Card(
            child: Column(
              children: [
                const Text('Tramadol'),
                Image.asset(
                  'images/tramadol.jpg', 
                  height: 180,
                ),
                const Text('Tramadol is used to help relieve moderate to moderately severe pain')
              ]
            )
          ),
        ),
      ],
    ),
    
  ];
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Medicine Products'),
        centerTitle: true,
        backgroundColor: Color(0xff23927e),
      ),
      body: PagesList.elementAt(_curIndex),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curIndex,
        backgroundColor: Color(0xff23927e),
        selectedItemColor: Colors.white,
        onTap:(value) {
          setState(() {
            _curIndex = value ;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Products'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart'
          ),
        ],
      ),
    );
  }
}