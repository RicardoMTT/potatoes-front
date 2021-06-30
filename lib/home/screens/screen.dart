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
            options: QueryOptions(document: getSlidersQueryDoc),
            builder: (result, {fetchMore, refetch}) {
              if (result.isLoading && result.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              print(result);
              final List<dynamic> sliders =
                  result.data['sliders'] as List<dynamic>;
              print(sliders);
              return ValueListenableBuilder<double>(
                valueListenable: _notifierScroll,
                builder: (context, value, _) {
                  return PageView.builder(
                    controller: _controller,
                    itemCount: sliders.length,
                    itemBuilder: (context, index) {
                      final slider = sliders[index];
                      final percentage = index - value;
                      final rotation =
                          double.parse(percentage.clamp(0, 1).toString());
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
                                  child: Image.network(
                                    "http://192.168.1.10:3001" +
                                        slider['avatar']['url'],
                                    fit: BoxFit.cover,
                                    width: sliderWidth,
                                    height: sliderHeight,
                                  )),
                            ),
                            Divider(),
                            Text(
                              'Descripción',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextOneLine(
                              slider['descripcion'],
                              overflow: TextOverflow.ellipsis,
                            )
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
              //                         "http://192.168.1.10:3001" +
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
