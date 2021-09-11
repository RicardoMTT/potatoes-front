import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:potatoes_test/home/queries/get_sliders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController();
  final _notifierScroll = ValueNotifier(0.0);
  void _listener() {
    _notifierScroll.value = _controller.page;
  }

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sliderHeight = size.height * 0.5;
    final sliderWidth = size.width * 0.7;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          body: Query(
            options: QueryOptions(
                document: getSlidersQueryDoc,
                fetchPolicy: FetchPolicy.networkOnly),
            builder: (result, {fetchMore, refetch}) {
              if (result.isLoading && result.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              print("DATA ${result}");
              final List<dynamic> sliders =
                  result.data['sliders'] as List<dynamic>;
              return ValueListenableBuilder<double>(
                valueListenable: _notifierScroll,
                builder: (context, value, _) {
                  return PageView.builder(
                    controller: _controller,
                    physics: BouncingScrollPhysics(),
                    itemCount: sliders.length,
                    itemBuilder: (context, index) {
                      final slider = sliders[index];
                      final percentage = index - value;
                      final rotation =
                          double.parse(percentage.clamp(0, 1).toString());

                      print("SLIDER ${sliders[index]}");
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Transform(
                                  alignment: Alignment.centerLeft,
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.002)
                                    ..rotateY(rotation),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "https://potatoes-app-heroku.herokuapp.com" +
                                          slider['avatar']['url'],
                                      fit: BoxFit.cover,
                                      width: sliderWidth,
                                      height: sliderHeight,
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              slider['titulo'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                child: Flexible(
                              child: RichText(
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(fontSize: 12.0),
                                text: TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    text: slider['descripcion']),
                              ),
                            )),
                          ],
                        ),
                      );
                    },
                  );
                },
              );

              // return Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     CarouselSlider(
              //         items: sliders.map((e) {
              //           return Builder(
              //             builder: (context) {
              //               return Padding(
              //                 padding: const EdgeInsets.all(14.0),
              //                 child: Column(
              //                   children: [
              //                     Container(
              //                       margin: EdgeInsets.symmetric(horizontal: 5),
              //                       decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.circular(20.0),
              //                         color: Colors.red,
              //                       ),
              //                       child: Image.network(
              //                         "https://potatoes-app-heroku.herokuapp.com/" +
              //                             e['avatar']['url'],
              //                         fit: BoxFit.cover,
              //                       ),
              //                     ),
              //                     SizedBox(
              //                       height: 10,
              //                     ),
              //                     Text(
              //                       'Descripcion',
              //                       style: TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 22,
              //                       ),
              //                     ),
              //                     Container(
              //                       margin: const EdgeInsets.symmetric(
              //                           horizontal: 10.0),
              //                       child: Text(e['descripcion']),
              //                     )
              //                   ],
              //                 ),
              //               );
              //             },
              //           );
              //         }).toList(),
              //         options: CarouselOptions(
              //           height: 440,
              //           viewportFraction: 1,
              //           autoPlayCurve: Curves.bounceInOut,
              //           enableInfiniteScroll: true,
              //           enlargeCenterPage: true,
              //           autoPlayAnimationDuration: Duration(milliseconds: 500),
              //         ))
              //   ],
              // );
            },
          )),
    );
  }
}
