import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sick_rags_flutter/components/custom_text_field.dart';
import 'package:sick_rags_flutter/config/app_colors.dart';
import 'package:sick_rags_flutter/core/providers/providers.dart';

class AdminWidget extends StatelessWidget {
  const AdminWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Consumer<AdminProvider>(builder: (context, adminProv, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Products',
                style: TextStyle(
                  fontFamily: 'Caveat',
                  fontSize: 24,
                ),
              ),
              const CustomTextField(
                labelText: 'Id',
                hintText: 'Product id',
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                labelText: 'Images',
                hintText: 'Add images link',
                addSuffix: true,
                controller: adminProv.imageController,
                onSaved: (p0) {
                  if (p0!.isNotEmpty) {
                    adminProv.getImages(p0);
                  }
                },
                addSuffixOntap: () {
                  if (adminProv.imageController.text.isNotEmpty) {
                    adminProv.getImages(adminProv.imageController.text);
                  }
                },
              ),
              ...List.generate(
                adminProv.images.length,
                (index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        adminProv.images[index],
                        style: const TextStyle(
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => adminProv.removeImage(index),
                      child: const Icon(
                        Icons.close,
                        size: 18.0,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                labelText: 'Images',
                hintText: 'Add images link',
                addSuffix: true,
                addSuffixOntap: () {
                  adminProv.images.add(adminProv.imageController.text);
                  adminProv.imageController.clear();
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
