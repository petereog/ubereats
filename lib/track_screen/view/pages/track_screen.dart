import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// Simple status enum for the order lifecycle.
/// Wire this up to your OrderViewModel / GetX controller later —
/// for now it drives the UI with local state so you can see it working.
enum OrderStatus { placed, preparing, onTheWay, delivered }

class TrackScreen extends StatefulWidget {
  const TrackScreen({super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  // TODO: replace with real data from your OrderController (GetX)
  OrderStatus currentStatus = OrderStatus.onTheWay;

  final String restaurantName = "Mama's Kitchen";
  final String orderId = "#PC-8231";
  final int itemCount = 3;
  final double total = 12450.00; // NGN

  final String riderName = "Chidi Okafor";
  final double riderRating = 4.8;
  final String vehicleInfo = "Bike • KJA 224 XL";

  // Mock coordinates — restaurant -> rider -> customer (Lagos)
  final LatLng restaurantLocation = const LatLng(6.5244, 3.3792);
  final LatLng riderLocation = const LatLng(6.5300, 3.3850);
  final LatLng customerLocation = const LatLng(6.5350, 3.3900);

  final MapController _mapController = MapController();

  String get etaText {
    switch (currentStatus) {
      case OrderStatus.placed:
        return "Order received";
      case OrderStatus.preparing:
        return "Preparing your order";
      case OrderStatus.onTheWay:
        return "Arriving in 12–18 mins";
      case OrderStatus.delivered:
        return "Delivered";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                _buildMap(),
                _buildTopBar(context),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: _buildBottomSheet(context),
          ),
        ],
      ),
    );
  }

  // ---------- Map ----------

  Widget _buildMap() {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: riderLocation,
        initialZoom: 14.5,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.pecumat.ubereats',
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: [restaurantLocation, riderLocation, customerLocation],
              strokeWidth: 4,
              color: Colors.black87,
            ),
          ],
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: restaurantLocation,
              width: 36,
              height: 36,
              child: const Icon(Icons.storefront, color: Colors.deepOrange),
            ),
            Marker(
              point: customerLocation,
              width: 36,
              height: 36,
              child: const Icon(Icons.home, color: Colors.blue),
            ),
            Marker(
              point: riderLocation,
              width: 44,
              height: 44,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: const Icon(Icons.motorcycle,
                    color: Colors.white, size: 22),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _circleButton(
              icon: Icons.arrow_back,
              onTap: () => Navigator.of(context).maybePop(),
            ),
            _circleButton(
              icon: Icons.help_outline,
              onTap: () {
                // TODO: open help / support flow
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.black87, size: 22),
      ),
    );
  }

  // ---------- Bottom sheet content ----------

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, -4)),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              etaText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text(
              "Order $orderId from $restaurantName",
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 20),
            _buildStatusStepper(),
            const SizedBox(height: 24),
            _buildRiderCard(),
            const SizedBox(height: 20),
            _buildOrderSummary(),
            const SizedBox(height: 20),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusStepper() {
    final steps = [
      (OrderStatus.placed, "Placed", Icons.receipt_long),
      (OrderStatus.preparing, "Preparing", Icons.restaurant),
      (OrderStatus.onTheWay, "On the way", Icons.delivery_dining),
      (OrderStatus.delivered, "Delivered", Icons.check_circle),
    ];

    return Row(
      children: List.generate(steps.length, (i) {
        final (status, label, icon) = steps[i];
        final isDone = status.index <= currentStatus.index;
        final isLast = i == steps.length - 1;

        return Expanded(
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isDone ? Colors.black : Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      size: 16,
                      color: isDone ? Colors.white : Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: isDone ? FontWeight.w600 : FontWeight.w400,
                      color: isDone ? Colors.black : Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    height: 2,
                    margin: const EdgeInsets.only(bottom: 16),
                    color: status.index < currentStatus.index
                        ? Colors.black
                        : Colors.grey.shade200,
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildRiderCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey.shade300,
            child: Text(
              riderName.substring(0, 1),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(riderName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15)),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: Colors.amber),
                    const SizedBox(width: 2),
                    Text(riderRating.toString(),
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade600)),
                    const SizedBox(width: 8),
                    Text(vehicleInfo,
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade600)),
                  ],
                ),
              ],
            ),
          ),
          _circleButton(icon: Icons.chat_bubble_outline, onTap: () {
            // TODO: open chat with rider
          }),
          const SizedBox(width: 8),
          _circleButton(icon: Icons.call_outlined, onTap: () {
            // TODO: launch phone call
          }),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$itemCount items",
          style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
        ),
        Text(
          "₦${total.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              // TODO: show cancel confirmation
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: const Text("Cancel order",
                style: TextStyle(color: Colors.black87)),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // TODO: open order details
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("Order details",
                style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}