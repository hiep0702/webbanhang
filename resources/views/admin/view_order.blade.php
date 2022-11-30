@extends('admin_layout')
@section('admin_content')
    <div class="table-agile-info">
        <div class="panel panel-default">
            <div class="panel-heading">
                Thông tin khách hàng
            </div>

            <div class="table-responsive">
                <?php
                $message = Session::get('message');
                if ($message) {
                    echo $message;
                    Session::put('message', null);
                }
                
                ?>
                <table class="table table-striped b-t b-light">
                    <thead>
                        <tr>
                            <th>Tên khách hàng</th>
                            <th>Email</th>
                            <th>Địa chỉ</th>
                            <th>Số điện thoại</th>
                            <th style="width:30px;"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{{ $order_by_id[0]->customer_name }}</td>
                            <td>{{ $order_by_id[0]->customer_email }}</td>
                            <td>{{ $order_by_id[0]->customer_address }}</td>
                            <td>{{ $order_by_id[0]->customer_phone }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
    <br>
    <br><br>
    <div class="table-agile-info">
        <div class="panel panel-default">
            <div class="panel-heading">
                Liệt kê chi tiết đơn hàng
            </div>
            <div class="table-responsive">
                <?php
                $message = Session::get('message');
                if ($message) {
                    echo $message;
                    Session::put('message', null);
                }
                
                ?>
                <table class="table table-striped b-t b-light">
                    <thead>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                            <th>Tổng tiền</th>
                            <th style="width:30px;"></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($order_by_id as $order_by_id[0])
                            <tr>
                                <td>{{ $order_by_id[0]->product_name }}</td>
                                <td>{{ $order_by_id[0]->product_sales_quantity }}</td>
                                <td>{{ number_format($order_by_id[0]->product_price) . ' ' . 'VNĐ' }}</td>
                                <td>{{ number_format($order_by_id[0]->product_price * $order_by_id[0]->product_sales_quantity) . ' ' . 'VNĐ' }}
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <footer class="panel-footer">
                <div class="row">
                    
                </div>
            </footer>
        </div>
    </div>
@endsection
