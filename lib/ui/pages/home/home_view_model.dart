import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pet_4_ever/data/repository/vworld_repository.dart';

class Homestate {
  int currentIndex;
  String? address;
  LatLng latLng;

  Homestate({
    required this.currentIndex,
    required this.address,
    required this.latLng,
  });
}

class HomeViewModel extends AutoDisposeNotifier<Homestate> {
  @override
  build() {
    return Homestate(currentIndex: 0, address: null, latLng: LatLng(0, 0));
  }

  void onIndexChanged(int newIndex) {
    state = Homestate(
      currentIndex: newIndex,
      address: state.address,
      latLng: state.latLng,
    );
  }

  Future<void> getAddress(double lat, double lng) async {
    print("주소가 변경되었어요!!");
    final vworldRepo = VworldRepository();
    final result = await vworldRepo.findByLatLng(lat, lng);
    final newAddress = result.first;
    state = Homestate(
      currentIndex: state.currentIndex,
      address: newAddress,
      latLng: LatLng(lat, lng),
    );
  }
}

final homeViewModel = NotifierProvider.autoDispose<HomeViewModel, Homestate>(
  () {
    return HomeViewModel();
  },
);
