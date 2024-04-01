import '../imports.dart';

class schmdashboard extends StatelessWidget {
  const schmdashboard({super.key});

  @override
  Widget build(BuildContext context) {
    double defaultRadius = 8.0;
    const double _cardWidth = 180;

    return Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: _cardWidth,
                height: 145,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: const [
                        Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.shopping_cart,
                            size: 35,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text("1043",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text("ToTal Eligible\nScheme"),
                        )
                      ],
                    ),
                  ),
                )),
            SizedBox(
                width: _cardWidth,
                height: 145,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: const [
                        Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.trending_up,
                            size: 35,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text("1043",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text("ToTal Scheme\nEarnings"),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ));
  }
}
