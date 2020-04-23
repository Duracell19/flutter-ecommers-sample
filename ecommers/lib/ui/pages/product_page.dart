import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:ecommers/core/models/data_models/index.dart';
import 'package:ecommers/generated/i18n.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart' hide BackButton;

import 'package:ecommers/ui/decorations/branding_colors.dart';
import 'package:ecommers/ui/decorations/dimens/index.dart';
import 'package:ecommers/ui/decorations/index.dart';
import 'package:ecommers/ui/widgets/icon_with_badge.dart';
import 'package:ecommers/ui/widgets/index.dart';
import 'package:ecommers/ui/widgets/product_page/index.dart';
import 'package:ecommers/core/provider_models/index.dart';
import 'package:ecommers/core/services/index.dart';

class ProductPage extends StatelessWidget {
  final Product productModel;
  const ProductPage({@required this.productModel, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabBarStyle = Theme.of(context).textTheme.subtitle1;
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final localization = I18n.of(context);

    final valueNotifier = ValueNotifier<int>(0);
    final pageController = PageController(initialPage: 0, keepPage: false);

    return ChangeNotifierProvider(
      create: (_) => ProductPageProviderModel(
        productModel,
        context: context,
      ),
      child: Consumer<ProductPageProviderModel>(
        builder: (context, ProductPageProviderModel model, child) {
          return Scaffold(
            backgroundColor: BrandingColors.pageBackground,
            appBar: AppBar(
              leading: const BackButton(),
              title: Header(
                title: productModel?.title,
                cost: productModel?.price,
                rate: productModel?.rate,
              ),
              actions: <Widget>[
                Selector<CartProvider, int>(
                  builder: (context, data, child) {
                    return IconButton(
                        icon: IconWithBadge(
                          badgeValue: cartProvider.orderCount,
                          badgeTextStyle: Theme.of(context).textTheme.overline,
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: BrandingColors.primaryText,
                          ),
                        ),
                        onPressed: () {
                          const int shellCartIndex = 2;
                          return navigationService.goBackToShell(
                              index: shellCartIndex);
                        });
                  },
                  selector: (buildContext, cartProvider) =>
                      cartProvider.orderCount,
                )
              ],
            ),
            body: DefaultTabController(
              length: 3,
              child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 320,
                      leading: const SizedBox(height: 0),
                      flexibleSpace: FlexibleSpaceBar(
                        background: CarouselWidget(
                          images: model.images,
                          currentPageNotifier: valueNotifier,
                          currentPageController: pageController,
                          height: 250,
                        ),
                      ),
                      bottom: PreferredSize(
                        preferredSize: const Size(0, Insets.x0),
                        child: Container(
                          color: BrandingColors.pageBackground,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Insets.x12_5),
                            child: TabBar(
                              indicator: const BubbleTabIndicator(
                                indicatorHeight: Insets.x8_5,
                                indicatorColor: BrandingColors.background,
                                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                              ),
                              labelStyle: tabBarStyle,
                              labelColor: BrandingColors.primary,
                              unselectedLabelColor: BrandingColors.primaryText,
                              isScrollable: false,
                              tabs: [
                                Tab(text: localization.product),
                                Tab(text: localization.details),
                                Tab(text: localization.reviews),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Insets.x4_5,
                        vertical: Insets.x4,
                      ),
                      child: ProductTab(
                        colors: model.colors,
                        sizes: model.sizes,
                        colorHasChanged: (images) => {
                          model.updateImages(images),
                          valueNotifier.value = 0,
                          pageController.jumpToPage(0),
                        },
                        skuIdHasChanged: (skuIdModel) =>
                            model.updateSkuId(skuIdModel),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Insets.x4_5,
                        vertical: Insets.x4,
                      ),
                      child: DetailsTab(
                        productDetailModel: productModel?.details,
                        skuId: model.skuId,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Insets.x4_5,
                        vertical: Insets.x4,
                      ),
                      child: ReviewsTab(
                          productReviewsModel: productModel?.reviews),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
