import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:weather_aapp/view/widgets/custom_background_gradient_color.dart';
import 'package:weather_aapp/view/widgets/date_and_location_widget.dart';
import 'package:weather_aapp/view/widgets/search_location_button.dart';
import 'package:weather_aapp/view/widgets/weather_details_widget.dart';
import 'package:weather_aapp/view/widgets/weather_of_next_days.dart';
import 'package:weather_aapp/view/widgets/weather_of_today_widget.dart';

import 'home_page_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final model;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    model = context.read<HomePageModel>().getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomBackgroundGradientColor(
          child: FutureBuilder(
            future: model,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.purpleAccent),
                );
              } else if (snapshot.hasData) {
                return const ViewDataWidget();
              } else {
                return const Center(
                  child: Text('No data'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class ViewDataWidget extends StatelessWidget {
  const ViewDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SearchLocationButton(),
        DateAndLocationWidget(),
        WeatherOfToday(),
        WeatherDetailsWidget(),
        WeatherOfNextDaysWidget(),
      ],
    );
  }
}