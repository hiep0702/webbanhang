@extends('admin_layout')
@section('admin_content')
    <div class="table-agile-info">
        <div class="panel panel-default">
            <div class="panel-heading">
                Liệt kê đơn hàng
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
                            <th>Tên người đặt</th>
                            <th>Tổng giá tiền</th>
                            <th>Tình trạng</th>
                            <th>Hiển thị</th>

                            <th style="width:30px;"></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($all_order as $key => $order)
                            <tr>
                                <td>{{ $order->customer_name }}</td>
                                <td>{{ $order->order_total }}</td>
                                <td>{{ $order->order_status }}</td>
                                <td>
                                    <a href="{{ URL::to('/view-order/' . $order->order_id) }}" class="active styling-edit"
                                        ui-toggle-class="">
                                        <i class="fa fa-pencil-square-o text-success text-active"></i>
                                    </a>
                                    <a onclick="return confirm('Bạn có muốn xóa đơn hàng không?')"
                                        href="{{ URL::to('/delete-order/' . $order->order_id) }}" class="active tyling-edit"
                                        ui-toggle-class="">
                                        <i class="fa fa-times text-danger text"></i>
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div style="margin-top: 5px">
              <form action="{{ url('export') }}" method="POST">
                  @csrf
                  <button class="btn btn-success" type="submit" name="export">Excel</button>
              </form>
          </div>
            <footer class="panel-footer">
                <div style="text-align: center;">
                    {{ $all_order->links() }}
                </div>
            </footer>
        </div>
    </div>
@endsection
