import 'package:flutter/material.dart';

class Order {
  final String date;
  final String address;
  final String status;
  final List<Product> products;
  final String paymentMethod;
  final double totalAmount;

  Order({
    required this.date,
    required this.address,
    required this.status,
    required this.products,
    required this.paymentMethod,
    required this.totalAmount,
  });
}

class Product {
  final String name;
  final double price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}

class OderPage extends StatefulWidget {
  const OderPage({super.key});

  @override
  State<OderPage> createState() => _OderPageState();
}

class _OderPageState extends State<OderPage> {
  @override
  Widget build(BuildContext context) {
    Order sampleOrder = Order(
      date: 'Ngày Mua',
      address: 'Địa Chỉ',
      status: 'Trạng Thái',
      products: [
        Product(name: 'Sản Phẩm 1', price: 20.0, image: 'images/logo.png'),
        // Thêm các sản phẩm khác nếu cần
      ],
      paymentMethod: 'Phương Thức Thanh Toán',
      totalAmount: 100.0, // Điền số tiền tổng
    );

    return Oder(order: sampleOrder);
  }
}

class Oder extends StatelessWidget {
  const Oder({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết đặt hàng'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ngày Mua: ${order.date}'),
            Text('Địa Chỉ: ${order.address}'),
            Text('Trạng Thái: ${order.status}'),
            SizedBox(height: 16.0),
            Text('Sản Phẩm:'),
            for (var product in order.products) ProductItem(product: product),
            SizedBox(height: 16.0),

            SizedBox(height: 16.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Phương Thức Thanh Toán: ${order.paymentMethod}'),
              Text('Tổng Tiền: ${order.totalAmount}'),
              Center(child:ElevatedButton(
                onPressed: () {
                  // Xử lý khi nút thanh toán được nhấn
                },
                child: Text('Xác Nhận Thanh Toán'),
              ) ,)

            ],
          )
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Text('Tổng Tiền: ${order.totalAmount}'),
          //     ElevatedButton(
          //       onPressed: () {
          //         // Xử lý khi nút thanh toán được nhấn
          //       },
          //       child: Text('Xác Nhận Thanh Toán'),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.asset(
          product.image, // Đặt tên ảnh sản phẩm phù hợp
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(product.name),
        subtitle: Text('Giá: ${product.price}'),
        trailing: Text(
            'Số lượng: 1'), // Bạn có thể thay đổi giá trị này tùy thuộc vào số lượng sản phẩm
      ),
    );
  }
}
