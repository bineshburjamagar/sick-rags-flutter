import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sick_rags_flutter/components/custom_button.dart';
import 'package:sick_rags_flutter/components/custom_text_field.dart';
import 'package:sick_rags_flutter/config/app_colors.dart';
import 'package:sick_rags_flutter/core/models/models.dart';
import 'package:sick_rags_flutter/core/providers/providers.dart';
import 'package:sick_rags_flutter/utils/validators.dart';

class AdminWidget extends StatelessWidget {
  AdminWidget({
    super.key,
  });
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Consumer2<AdminProvider, ProductsProvider>(
        builder: (context, adminProv, productProv, child) {
          return Form(
            key: formKey,
            child: Padding(
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
                  CustomTextField(
                    labelText: 'Id',
                    hintText: '${productProv.productsList.last.id + 1}',
                    controller: adminProv.idController,
                    enable: false,
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
                    labelText: 'Available Sizes',
                    hintText: 'Add available sizes',
                    addSuffix: true,
                    controller: adminProv.sizesController,
                    onSaved: (p0) {
                      if (p0!.isNotEmpty) {
                        adminProv.getSizes(p0);
                      }
                    },
                    addSuffixOntap: () {
                      if (adminProv.sizesController.text.isNotEmpty) {
                        adminProv.getSizes(adminProv.sizesController.text);
                      }
                    },
                  ),
                  ...List.generate(
                    adminProv.sizes.length,
                    (index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            adminProv.sizes[index],
                            style: const TextStyle(
                              color: AppColors.greyColor,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => adminProv.removeSize(index),
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
                    labelText: 'Name',
                    hintText: 'Product name',
                    controller: adminProv.titleController,
                    validator: Validators.isRequired,
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextField(
                    labelText: 'Price',
                    hintText: 'Product price',
                    controller: adminProv.priceController,
                    validator: Validators.isRequired,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextField(
                    labelText: 'Description',
                    hintText: 'Product description',
                    controller: adminProv.descriptionController,
                    validator: Validators.isRequired,
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Is popular:',
                            style: TextStyle(
                              color: AppColors.greyColor,
                            ),
                          ),
                          Checkbox(
                              value: adminProv.isPopular,
                              onChanged: (v) {
                                adminProv.isPopularProduct(v);
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Is recent:   ',
                            style: TextStyle(
                              color: AppColors.greyColor,
                            ),
                          ),
                          Checkbox(
                              value: adminProv.isRecent,
                              onChanged: (v) {
                                adminProv.isRecentProduct(v);
                              }),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ProductModel productData = ProductModel(
                            id: productProv.productsList.last.id + 1,
                            name: adminProv.titleController.text,
                            price: int.parse(adminProv.priceController.text),
                            availableSize: adminProv.sizes,
                            isPopular: adminProv.isPopular ?? false,
                            isRecent: adminProv.isRecent ?? false,
                            images: adminProv.images,
                            description: adminProv.descriptionController.text,
                          );

                          productProv.database
                              .collection('products')
                              .add(productData.toJson());
                          adminProv.clearData();
                          productProv.productsList.clear();
                          FocusScope.of(context).unfocus();
                          BotToast.showText(text: 'Product Added');
                          productProv.getProductsData();
                        }
                      },
                      label: 'Add Products')
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
