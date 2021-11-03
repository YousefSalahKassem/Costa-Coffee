import 'package:costacoffe/model/most_selling_model.dart';
import 'package:costacoffe/view_model/home_view_model.dart';
import 'package:firestore_search/firestore_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:page_transition/page_transition.dart';

import 'control_screen.dart';
import 'details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Search',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(onPressed: (){Navigator.pushReplacement(context, PageTransition(child: const ControlScreen(), type: PageTransitionType.rightToLeft));}, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body:  GetBuilder<HomeViewModel>(
        init: Get.find<HomeViewModel>(),
        builder:(controller)=> Container(
          margin: EdgeInsets.only(bottom: 6.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
          child: FirestoreSearchScaffold(
              searchTextHintColor: Colors.white,
              searchBackgroundColor: Colors.black,
              appBarBackgroundColor: Color(0xFF6F2A3B),
              searchBodyBackgroundColor: Colors.black,
              searchTextColor: Colors.white,
              scaffoldBackgroundColor: Colors.black,
              firestoreCollectionName: 'Products',
              searchBy: 'name',
              scaffoldBody: const Center(child: Text('Find your coffee...',style: TextStyle(color: Colors.white),)),
              builder: (context,snapshot){
                if (snapshot.hasData) {
                  final List<MostSellingModel>? dataList = snapshot.data;
                  return ListView.builder(
                      itemCount: dataList?.length ?? 0,
                      itemBuilder: (context,index){
                        final MostSellingModel data = dataList![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.pushReplacement(context, PageTransition(child: CoffeeDetailsPage(mostSellingModel:dataList[index],), type: PageTransitionType.leftToRight));
                            },
                            child: ListTile(
                              title: Text(
                                '${data.name}',
                                style: TextStyle(color: Colors.white),
                              ),
                              leading: Image.network(data.image,width: 100,height: 100,fit: BoxFit.cover,),
                            ),
                          ),
                        );
                      });
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  if (!snapshot.hasData){
                    return const Center(child: Text('No Results Returned'),);
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              dataListFromSnapshot: MostSellingModel(details: "",image: '',content: [],category: '',description: '',id: '',name: '',rate: '',roastedType: '',size: []).dataListFromSnapshot),

        ),
      ),
    );
  }
}
