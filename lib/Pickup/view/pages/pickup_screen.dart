import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PickupScreen extends StatefulWidget {
  const PickupScreen({super.key});

  @override
  State<PickupScreen> createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  final MapController _mapController = MapController();
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  final LatLng _center = const LatLng(6.5244, 3.3792);

  final List<_RestaurantMarker> _restaurants = [
    _RestaurantMarker(point: LatLng(6.5280, 3.3750), type: MarkerType.rating, label: '4.5'),
    _RestaurantMarker(point: LatLng(6.5260, 3.3810), type: MarkerType.rating, label: '4.7'),
    _RestaurantMarker(point: LatLng(6.5230, 3.3770), type: MarkerType.rating, label: '4.1'),
    _RestaurantMarker(point: LatLng(6.5270, 3.3830), type: MarkerType.rating, label: '4.9'),
    _RestaurantMarker(point: LatLng(6.5215, 3.3800), type: MarkerType.rating, label: '4.7'),
    _RestaurantMarker(point: LatLng(6.5245, 3.3720), type: MarkerType.rating, label: '4.6'),
    _RestaurantMarker(point: LatLng(6.5200, 3.3760), type: MarkerType.rating, label: '4.0'),
    _RestaurantMarker(point: LatLng(6.5290, 3.3790), type: MarkerType.rating, label: '4.7'),
    _RestaurantMarker(point: LatLng(6.5185, 3.3815), type: MarkerType.rating, label: '4.5'),
    _RestaurantMarker(point: LatLng(6.5175, 3.3745), type: MarkerType.rating, label: '3.3'),
    _RestaurantMarker(point: LatLng(6.5255, 3.3740), type: MarkerType.cluster, label: '11'),
    _RestaurantMarker(point: LatLng(6.5210, 3.3840), type: MarkerType.cluster, label: '2'),
    _RestaurantMarker(point: LatLng(6.5195, 3.3830), type: MarkerType.cluster, label: '2'),
    _RestaurantMarker(point: LatLng(6.5275, 3.3760), type: MarkerType.icon, label: ''),
    _RestaurantMarker(point: LatLng(6.5240, 3.3800), type: MarkerType.icon, label: ''),
    _RestaurantMarker(point: LatLng(6.5220, 3.3780), type: MarkerType.newRestaurant, label: 'New'),
    _RestaurantMarker(point: LatLng(6.5195, 3.3800), type: MarkerType.newRestaurant, label: 'New'),
    _RestaurantMarker(point: LatLng(6.5178, 3.3780), type: MarkerType.newRestaurant, label: 'New'),
    _RestaurantMarker(point: LatLng(6.5265, 3.3810), type: MarkerType.named, label: '7-Eleven'),
    _RestaurantMarker(point: LatLng(6.5232, 3.3758), type: MarkerType.named, label: 'Z Deli'),
    _RestaurantMarker(point: LatLng(6.5225, 3.3820), type: MarkerType.named, label: "Famous Original Ray's"),
    _RestaurantMarker(point: LatLng(6.5188, 3.3760), type: MarkerType.named, label: "Bagel O Klock"),
    _RestaurantMarker(point: LatLng(6.5172, 3.3795), type: MarkerType.named, label: "Buddy V's Cake Slice"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _center,
                initialZoom: 15.0,
                minZoom: 10.0,
                maxZoom: 19.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.pecumat.ubereatsclone',
                ),
                MarkerLayer(
                  markers: _restaurants.map((r) => _buildMarker(r)).toList(),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
            child: _buildSearchBar(),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 80,
            right: 16,
            child: _buildCompassButton(),
          ),
          DraggableScrollableSheet(
            controller: _sheetController,
            initialChildSize: 0.32,
            minChildSize: 0.14,
            maxChildSize: 0.80,
            snap: true,
            snapSizes: const [0.14, 0.32, 0.80],
            builder: (context, scrollController) {
              return _buildBottomSheet(scrollController);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const Icon(Icons.search, color: Colors.black87, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Restaurants, cuisines, dishes',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(width: 1, height: 28, color: Colors.grey[200]),
          const SizedBox(width: 14),
          const Icon(Icons.tune, color: Colors.black87, size: 20),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildCompassButton() {
    return GestureDetector(
      onTap: () => _mapController.move(_center, 15.0),
      child: Container(
        width: 52,
        height: 52,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 3)),
          ],
        ),
        child: const Icon(Icons.navigation, color: Colors.white, size: 24),
      ),
    );
  }

  Widget _buildBottomSheet(ScrollController scrollController) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16, offset: Offset(0, -4)),
        ],
      ),
      child: ListView(
        controller: scrollController,
        padding: EdgeInsets.zero,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 14),
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(height: 70, width: 75, child: Image.asset('assets/images/con 1.png')),
                    const Text('Fast Food'),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 70, width: 75, child: Image.asset('assets/images/convenience 1 (1).png')),
                    const Text('Carribean'),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 70, width: 75, child: Image.asset('assets/images/convenience 1 (2).png')),
                    const Text('Chinese'),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 70, width: 75, child: Image.asset('assets/images/convenience 1 (3).png')),
                    const Text('French'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---- Food card 1: Adenine Kitchen ----
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFE6E6E6),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/2b66a64e-78c0-4d01-b6c0-0230f4ec72e5 1.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 150,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                            child: const Icon(Icons.favorite_border, color: Colors.black, size: 20),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF06C167),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              '5 orders until reward',
                              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text('Adenine Kitchen',
                            style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text('44', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    const Text('Delivery to Ikeja . 10-25min',
                        style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400)),
                  ],
                ),
                const SizedBox(height: 20),
                // ---- Food card 2: Cardinal Chips ----
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFE6E6E6),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/postercard.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 150,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                            child: const Icon(Icons.favorite_border, color: Colors.black, size: 20),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text('Cardinal Chips',
                            style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text('44', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    const Text('Delivery to Obawole, Ogba . 5-15min',
                        style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Marker _buildMarker(_RestaurantMarker r) {
    Widget child;
    switch (r.type) {
      case MarkerType.rating:
        child = _RatingBubble(rating: r.label);
        break;
      case MarkerType.cluster:
        child = _ClusterBubble(count: r.label);
        break;
      case MarkerType.icon:
        child = _IconBubble();
        break;
      case MarkerType.newRestaurant:
        child = _NewBubble();
        break;
      case MarkerType.named:
        child = _NamedBubble(name: r.label);
        break;
    }
    return Marker(
      point: r.point,
      width: r.type == MarkerType.named ? 160 : 72,
      height: r.type == MarkerType.newRestaurant ? 50 : 36,
      child: child,
    );
  }
}

enum MarkerType { rating, cluster, icon, newRestaurant, named }

class _RestaurantMarker {
  final LatLng point;
  final MarkerType type;
  final String label;
  const _RestaurantMarker({required this.point, required this.type, required this.label});
}

class _RatingBubble extends StatelessWidget {
  final String rating;
  const _RatingBubble({required this.rating});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.18), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Text(rating, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black)),
    );
  }
}

class _ClusterBubble extends StatelessWidget {
  final String count;
  const _ClusterBubble({required this.count});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.18), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.restaurant, size: 13, color: Colors.black87),
          const SizedBox(width: 4),
          Text(count, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black)),
        ],
      ),
    );
  }
}

class _IconBubble extends StatelessWidget {
  const _IconBubble();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.18), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: const Icon(Icons.restaurant, size: 14, color: Colors.black87),
    );
  }
}

class _NewBubble extends StatelessWidget {
  const _NewBubble();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('New', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF06C167))),
        const SizedBox(height: 2),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 5, offset: const Offset(0, 2))],
          ),
          child: const Icon(Icons.restaurant, size: 13, color: Colors.black87),
        ),
      ],
    );
  }
}

class _NamedBubble extends StatelessWidget {
  final String name;
  const _NamedBubble({required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.18), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Text(
        name,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }
}
