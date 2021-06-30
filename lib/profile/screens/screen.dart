import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potatoes_test/app_constants/color.dart';
import 'package:potatoes_test/app_widgets/common_text_field.dart';
import 'package:potatoes_test/profile/screens/form_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: 260,
                child: Stack(children: [
                  Container(
                    height: 190,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                      boxShadow: [
                        // BoxShadow(
                        //   offset: Offset(0, 4),
                        //   blurRadius: 4,
                        //   color: Colors.black12,
                        // )
                      ],
                    ),
                    child: Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text('Tarjeta'),
                        //       IconButton(icon: Icon(Icons.menu), onPressed: () {})
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, top: 10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Welcome back',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.white),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30, top: 40),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                Text(
                                  'Ricardo Tovar.',
                                  style: GoogleFonts.lato(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 30,
                    child: Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrG4EXV-tktmJoAhbdaOhnQorH_2vQQspj19tt6IYLpdthQfPZY71cCg0jzcU&s'),
                            fit: BoxFit.cover,
                            width: 100,
                          ),
                        )),
                  )
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              BlocProvider(
                create: (_) => ProfileFormBloc(),
                child: Builder(
                  builder: (context) {
                    final _formBloc = BlocProvider.of<ProfileFormBloc>(context);
                    return Column(
                      children: [
                        CommonTextField(
                          keyBoardType: TextInputType.text,
                          textFieldBloc: _formBloc.firstName,
                          placeholder: "Nombre y apellido",
                          icon: Icons.person,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CommonTextField(
                          keyBoardType: TextInputType.number,
                          textFieldBloc: _formBloc.firstName,
                          placeholder: "DNI",
                          icon: Icons.domain_verification_outlined,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CommonTextField(
                            keyBoardType: TextInputType.number,
                            textFieldBloc: _formBloc.firstName,
                            placeholder: "Teléfono",
                            icon: Icons.phone),
                        SizedBox(
                          height: 10,
                        ),
                        CommonTextField(
                          keyBoardType: TextInputType.emailAddress,
                          textFieldBloc: _formBloc.firstName,
                          placeholder: "email",
                          icon: Icons.email,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CommonTextField(
                          keyBoardType: TextInputType.visiblePassword,
                          textFieldBloc: _formBloc.firstName,
                          placeholder: "Contraseña",
                          icon: Icons.keyboard,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 330,
                          height: 50,
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: kPrimaryColor,
                            onPressed: () {},
                            child: Text('Guardar cambios'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  },
                ),
              )

              // Expanded(
              //   child: GridView.count(
              //     crossAxisCount: 2,
              //     mainAxisSpacing: 20,
              //     crossAxisSpacing: 20,
              //     children: [
              //       Container(
              //         height: 80,
              //         margin:
              //             EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //         decoration: BoxDecoration(
              //             color: kPrimaryColor,
              //             borderRadius: BorderRadius.circular(20.0)),
              //       ),
              //       Container(
              //         height: 80,
              //         margin:
              //             EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //         decoration: BoxDecoration(
              //             color: kPrimaryColor,
              //             borderRadius: BorderRadius.circular(20.0)),
              //       ),
              //       Container(
              //         height: 80,
              //         margin:
              //             EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //         decoration: BoxDecoration(
              //             color: kPrimaryColor,
              //             borderRadius: BorderRadius.circular(20.0)),
              //       ),
              //       Container(
              //         height: 80,
              //         margin:
              //             EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //         decoration: BoxDecoration(
              //             color: kPrimaryColor,
              //             borderRadius: BorderRadius.circular(20.0)),
              //       ),
              //       Container(
              //         height: 80,
              //         margin:
              //             EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //         decoration: BoxDecoration(
              //             color: kPrimaryColor,
              //             borderRadius: BorderRadius.circular(20.0)),
              //       ),
              //       Container(
              //         height: 80,
              //         margin:
              //             EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //         decoration: BoxDecoration(
              //             color: kPrimaryColor,
              //             borderRadius: BorderRadius.circular(20.0)),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
