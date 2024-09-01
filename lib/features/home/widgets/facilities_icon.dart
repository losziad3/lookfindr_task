import 'package:flutter/material.dart';

class FacilitiesIcons {
  final Widget icon;
  final String label;

  FacilitiesIcons({required this.icon, required this.label});
}

class FeatureButtonRow extends StatelessWidget {
  final List<FacilitiesIcons> buttons;

  const FeatureButtonRow({required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: buttons.map((button) => _buildFeatureButton(button)).toList(),
    );
  }

  Widget _buildFeatureButton(FacilitiesIcons button) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          button.icon,
          const SizedBox(height: 4),
          Text(
            button.label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}