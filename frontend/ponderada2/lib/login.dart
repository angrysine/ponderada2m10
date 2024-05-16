import 'package:flutter/material.dart';
import 'package:ponderada2/task.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  @override
  final _formKey = GlobalKey<FormState>();
  double formPadding = 16;
  double formPaddingVertical = 16;
  bool _passwordVisible = false;
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  void printController() {
    print(_nameController.text);
    print(_passwordController.text);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const TaskMainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: formPadding, vertical: formPaddingVertical),
              child: const Text(
                "Login",
                style: TextStyle(height: 3, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: formPadding, vertical: formPaddingVertical),
              child: NameInput(
                nameController: _nameController,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: formPadding, vertical: formPaddingVertical),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira algum texto';
                  }

                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Senha',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.remove_red_eye_outlined),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    )),
                obscureText: !_passwordVisible,
                controller: _passwordController,
              ),
            ),
            LoginButton(
              formKey: _formKey,
              pressed: printController,
            ),
          ],
        ));
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required Function pressed,
  })  : _formKey = formKey,
        _pressed = pressed;

  final GlobalKey<FormState> _formKey;
  final Function _pressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Validate returns true if the form is valid, or false otherwise.
        if (_formKey.currentState!.validate()) {
          _pressed();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );
        }
      },
      child: const Text('Login'),
    );
  }
}

class NameInput extends StatelessWidget {
  const NameInput({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;
  final TextEditingController _nameController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Insira algum texto';
        }

        return null;
      },
      decoration: const InputDecoration(
          labelText: 'Nome', border: OutlineInputBorder()),
      controller: _nameController,
    );
  }
}
