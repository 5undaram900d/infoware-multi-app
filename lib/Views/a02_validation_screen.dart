
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infoware_multi_app/Controllers/a03_validation_controller.dart';
import 'package:infoware_multi_app/CustumWidgets/a04_rounded_button.dart';
import 'package:infoware_multi_app/Views/a05_product_screen.dart';

class ValidationScreen extends StatefulWidget {
  const ValidationScreen({Key? key}) : super(key: key);

  @override
  State<ValidationScreen> createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {

  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(ValidationController());

  late final name;
  late final email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validate Yourself!', style: TextStyle(fontSize: 28),),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controller.fullName,
                      decoration: const InputDecoration(
                        hintText: 'Full Name',
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value){
                        name = value;
                        if(value!.isEmpty){
                          return 'Enter Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.email,
                      decoration: const InputDecoration(
                        hintText: 'Username',
                        helperText: 'Enter email e.g abc@gmail.com',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value){
                        email = value;
                        if(value!.isEmpty){
                          return 'Enter email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: controller.phoneNo,
                      decoration: const InputDecoration(
                        hintText: '+91-9876543210',
                        helperText: 'Enter Mobile no.',
                        prefixIcon: Icon(Icons.phone_android),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Mobile no.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controller.gender,
                      decoration: const InputDecoration(
                          hintText: 'male, female or other',
                          prefixIcon: Icon(Icons.transgender)
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Your Sex';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controller.country,
                      decoration: const InputDecoration(
                          hintText: 'India',
                          prefixIcon: Icon(CupertinoIcons.location_solid)
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Your Country';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controller.state,
                      decoration: const InputDecoration(
                          hintText: 'Utter Pradesh',
                          prefixIcon: Icon(CupertinoIcons.location)
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter your state';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controller.city,
                      decoration: const InputDecoration(
                          hintText: 'Lucknow',
                          prefixIcon: Icon(Icons.location_city)
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter your city';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30,),
              RoundButton(
                title: 'Validate',
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    print(controller.fullName);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProductScreen(name: name.toString(), email: email.toString(),),),);
                  }
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}
