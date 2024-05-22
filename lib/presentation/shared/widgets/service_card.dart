import 'package:flutter/material.dart';

import '../../../domain/domain.dart';


class ServiceCard extends StatelessWidget {

  final Services services;

  const ServiceCard({
    super.key, 
    required this.services,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ImageViewer( 
          images: services.images,
          title: services.name,
          description: services.description,
          minPrice: services.minPrice,
          maxPrice: services.maxPrice,
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}

class _ImageViewer extends StatelessWidget {

  final List<String> images;
  final String title;
  final String description;
  final double minPrice;
  final double maxPrice;

  const _ImageViewer({
    required this.images,
    this.title = '', 
    this.description = '',
    this.minPrice = 0,
    this.maxPrice = 0,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    if ( images.isEmpty ) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                blurRadius: 5,
                offset: Offset(0, 3)
              ),
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/no-image.jpg', 
                fit: BoxFit.cover,
                height: 250,
                width: size.width * 0.93,
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Desde: \$${minPrice.toStringAsFixed(2)} - ${maxPrice.toStringAsFixed(2)} ',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: FadeInImage(
        fit: BoxFit.cover,
        height: 250,
        width: size.width * 0.93,
        fadeOutDuration: const Duration(milliseconds: 100),
        fadeInDuration: const Duration(milliseconds: 200),
        image: NetworkImage( images.first ),
        placeholder: const AssetImage('assets/loaders/loader2.gif'),
      ),
    );

  }
}