import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parking_grid_admin/shared/styles/colors.dart';

import 'package:widget_circular_animator/widget_circular_animator.dart';

Widget myDivider() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey.withOpacity(0.4),
      ),
    );

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefix != null ? Icon(prefix) : null,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(8.0),
          ),
          borderSide: new BorderSide(
            color: Colors.black,
            width: 4.0,
          ),
        ),
      ),
    );

void navigateTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

Widget defaultButton({
  double width = double.infinity,
  Color background = defaultColor,
  bool isUpperCase = true,
  double radius = 3.0,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

void showToastt({@required String msg, @required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green.withOpacity(0.8);
      break;
    case ToastStates.ERROR:
      color = Colors.red.withOpacity(0.8);
      break;
    case ToastStates.WARNING:
      color = Colors.amber.withOpacity(0.8);
      break;
  }
  return color;
}

Widget defaultTextButton(
        {@required Function function, @required String title}) =>
    TextButton(
        onPressed: function,
        child: Text(
          title.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, color: defaultColor),
        ));

Widget customAppBar({@required String title}) => AppBar(
      iconTheme: IconThemeData(color: Color(0xff078547)),
      title: Center(
        child: Row(
          children: <Widget>[
            Image.asset(
              'assets/images/logo_splash.png',
              height: 50,
              width: 50,
            ),
            Text(
              title,
              style: TextStyle(color: Color(0xff078547), fontSize: 17),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Image.asset(
          'assets/images/w.png',
          height: 100,
          width: 100,
        )
      ],
    );

Widget cutomContianer(context,
        {@required Widget widget,
        @required Color colorside,
        @required String imagePath,
        @required String text}) =>
    Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            navigateTo(context, widget);
          },
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border(left: BorderSide(color: colorside, width: 15)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 1))
              ],
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imagePath,width: 100,height: 100,),
                Text(
                  text.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                )
              ],
            ),
          ),
        ),
      ),
    );

Widget buildInfoPark({@required Color color, @required String string}) => Row(
      children: [
        CircleAvatar(
            backgroundColor: Colors.black26,
            radius: 12.5,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 10,
            )),
        SizedBox(
          width: 5,
        ),
        Text(
          string,
        )
      ],
    );

Widget logoNewDesign() => WidgetCircularAnimator(
    size: 150,
    innerColor: Colors.white,
    outerColor: Colors.white,
    innerAnimation: Curves.bounceOut,
    reverse: false,
    child: Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade900.withOpacity(0.3).withGreen(10),
            borderRadius: BorderRadius.circular(150)),
        child: Image.asset(
          'assets/images/logo_splash.png',
          fit: BoxFit.cover,
        ),
      ),
    ));
