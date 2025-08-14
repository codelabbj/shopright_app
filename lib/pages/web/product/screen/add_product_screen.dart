import 'package:e_com_app/pages/web/product/widgets/add_products_widget.dart';
import 'package:e_com_app/widgets/app_bar_widget.dart';
import 'package:e_com_app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  void initState() {
    super.initState();

    // _checkAuthentication();
    // context.read<CollaborateursCubit>().getCustomerDetails();
  }
  //
  // void _checkAuthentication() async {
  //   final token = SharedPreferencesUtils.getString('auth_token');
  //   if (token == null || token.isEmpty) {
  //     // Rediriger vers la page de login
  //     context.go('/login'); // ou Navigator.of(context).pushReplacementNamed('/login');
  //   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Row(
          children: [
            DrawerDashboard(),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 60, child: AppbarDashboard()),
                  Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.2),
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset: Offset(0,
                              3), // Décalage horizontal et vertical de l'ombre
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey[300]!)),
                          child: Icon(Icons.arrow_back),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add new Product",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "you can see all sales analysis result more completely",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: Colors.grey[300]),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(flex: 2, child: AddProductsWidget()),
                      Flexible(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.2),
                                spreadRadius: 10,
                                blurRadius: 10,
                                offset: Offset(0,
                                    3), // Décalage horizontal et vertical de l'ombre
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
