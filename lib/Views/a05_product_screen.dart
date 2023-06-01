
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infoware_multi_app/Controllers/a08_remote_services.dart';
import 'package:infoware_multi_app/CustumWidgets/a06_drawer.dart';
import 'package:infoware_multi_app/Modules/a07_product_module.dart';

class ProductScreen extends StatefulWidget {

  String name;
  String email;

  ProductScreen({Key? key, required this.name, required this.email}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState(name: name, email: email);
}

class _ProductScreenState extends State<ProductScreen> {

  String name;
  String email;

  _ProductScreenState({required this.name, required this.email});

  bool playSound = false;
  final player = AudioPlayer();

  List<ProductModule>? products = [];
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async{
    products = await RemoteServices().getProducts();
    debugPrint(products.toString());
    if(products != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(playSound ? CupertinoIcons.stop_fill : CupertinoIcons.play_fill),
            onPressed: (){
              if(playSound==false){
                player.play(AssetSource('sound.mp3'));
              }
              else{
                player.stop();
              }
              setState(() {
                playSound = !playSound;
              });
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: MyDrawer(name: name, email: email,),
      ),

      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator(),),
        child: ListView.builder(
            itemCount: products?.length,
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: ClipRect(
                    child: Banner(
                      message: '${products![index].rating.rate.toString()} Star',
                      location: BannerLocation.topEnd,
                      color: Colors.red,
                      child: Container(
                        color: Colors.blueGrey,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Image.network(products![index].image.toString()),
                              const SizedBox(height: 10,),
                              Column(
                                children: [
                                  Text(products![index].title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
                                    onPressed: (){},
                                    child: const Text('Get Now'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
      ),

    );
  }
}
