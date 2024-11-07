import 'package:flutter/material.dart';
import 'package:task/travel/controller/travel_controller.dart';
import 'package:task/travel/model/travel_details_model.dart';
import 'package:task/travel/model/travel_model.dart';

class Travel extends StatefulWidget {
  const Travel({super.key});

  @override
  State<Travel> createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  late List<TravelModel>? _travelModel = [];
  late List<TravelDetailsModel>? _travelDetailsModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _travelDetailsModel = (await TravelController.travelDetails())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel'),
      ),
      body: _travelDetailsModel == null || _travelDetailsModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _travelDetailsModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _travelDetailsModel![index].groupPhoto.toString() ==
                                  ""
                              ? const SizedBox()
                              : Image.network(
                                  _travelDetailsModel![index]
                                      .groupPhoto
                                      .toString(),
                                  width: 20,
                                ),
                          Text(_travelDetailsModel![index].id.toString()),
                          Text(_travelDetailsModel![index].travel.name),
                          Text(_travelDetailsModel![index].travel.description),
                          Text(_travelDetailsModel![index].travelAgenda),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
