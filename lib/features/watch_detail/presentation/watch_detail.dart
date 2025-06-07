import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../utils/context_extensions.dart';
import '../../store/domain/product.dart';

class WatchDetails extends HookWidget {
  const WatchDetails({super.key, required this.watch});
  final Product watch;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> cartItemCount = useState(1);
    
    // Simple opening animation
    final AnimationController animationController = useAnimationController(
      duration: const Duration(milliseconds: 1200),
    );
    

    final double scaleAnimation = useAnimation(
      Tween<double>(begin: 0.8, end: 1).animate(
        CurvedAnimation(
          parent: animationController, 
          curve: const Interval(0.2, 1, curve: Curves.elasticOut), // Slower scale (80% of duration, starts later)
        ),
      ),
    );
    
    // Start animation on build
    useEffect(() {
      animationController.forward();
      return null;
    }, <Object?>[]);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            pinned: true,
            expandedHeight: MediaQuery.sizeOf(context).height * 0.5,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(230),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(230),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.favorite_border, color: Colors.black),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: <Widget>[
                  // Background split design
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          color: const Color.fromRGBO(245, 245, 245, 1),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: context.theme.colorScheme.primary,
                        ),
                      )
                    ],
                  ),
                  // Animated watch image
                  Center(
                    child: Transform.scale(
                      scale: scaleAnimation,
                      child: Container(
                        width: 300,
                        height: 300,
                        margin: const EdgeInsets.only(top: 60),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 40,
                              offset: const Offset(0, 20),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          watch.image,
                          fit: BoxFit.fitHeight,
                          width: 280,
                          height: 280,
                          gaplessPlayback: true,
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                            return const Icon(
                              Icons.watch,
                              size: 140,
                              color: Colors.grey,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Product title
                        RichText(
                          text: TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: watch.brand,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(34, 34, 34, 1),
                                ),
                              ),
                              TextSpan(
                                text: ' ${watch.name}',
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromRGBO(34, 34, 34, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${watch.model} • ${watch.category}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Quantity and price section
                        Row(
                          children: <Widget>[
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color.fromRGBO(230, 230, 230, 1),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  CounterButton(
                                    icon: Icons.remove,
                                    onTap: () {
                                      if (cartItemCount.value > 1) {
                                        cartItemCount.value -= 1;
                                      }
                                    },
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                    child: Text(
                                      '${cartItemCount.value}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Color.fromRGBO(34, 34, 34, 1),
                                      ),
                                    ),
                                  ),
                                  CounterButton(
                                    icon: Icons.add,
                                    onTap: () {
                                      cartItemCount.value += 1;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '\$${(watch.price * cartItemCount.value).toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 28,
                                color: Color.fromRGBO(34, 34, 34, 1),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Description
                        Text(
                          watch.description,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Features section
                        const Text(
                          'Features',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(34, 34, 34, 1),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const FeatureItem(label: 'Water Resistant', value: '50M'),
                        const FeatureItem(label: 'Movement', value: 'Automatic'),
                        const FeatureItem(label: 'Case Size', value: '42mm'),
                        const FeatureItem(label: 'Material', value: 'Stainless Steel'),
                        const SizedBox(height: 32),
                        // Add to cart button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Added ${cartItemCount.value} ${watch.name} to cart',
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.theme.colorScheme.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).padding.bottom + 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  const FeatureItem({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(34, 34, 34, 1),
            ),
          ),
        ],
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  const CounterButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Icon(
          icon,
          size: 20,
          color: const Color.fromRGBO(34, 34, 34, 1),
        ),
      ),
    );
  }
}
