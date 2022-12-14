@extends('layouts')
@section('content')
    <section id="cart_items">
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="{{ URL::to('/') }}">Trang chủ</a></li>
                    <li class="active">Thanh toán giỏ hàng</li>
                </ol>
            </div>

            <div class="register-req">
                <p>Làm ơn đăng ký hoặc đăng nhập để thanh toán giỏ hàng và xem lại lịch sử mua hàng</p>
            </div>
            <!--/register-req-->

            <div class="shopper-informations">
                <div class="row">

                    <div class="col-sm-12 clearfix">
                        <div class="bill-to">
                            <p>Điền thông tin gửi hàng</p>
                            <div class="form-one">
                                <form action="{{ URL::to('/save-checkout-customer') }}" method="POST">
                                    {{ csrf_field() }}

                                    <input type="text" name="shipping_email" placeholder="Email">
                                    @error('shipping_email')
                                        <span style="color: red; width: 100%">{{ $message }}</span>
                                    @enderror


                                    <input type="text" name="shipping_name" placeholder="Họ và tên">
                                    @error('shipping_name')
                                        <span style="color: red; width: 100%">{{ $message }}</span>
                                    @enderror


                                    <input type="text" name="shipping_address" placeholder="Địa chỉ">
                                    @error('shipping_address')
                                        <span style="color: red; width: 100%">{{ $message }}</span>
                                    @enderror


                                    <input type="text" name="shipping_phone" placeholder="Phone">
                                    @error('shipping_phone')
                                        <span style="color: red; width: 100%">{{ $message }}</span>
                                    @enderror


                                    <textarea name="shipping_notes" placeholder="Ghi chú đơn hàng của bạn" rows="10"></textarea>
                                    @error('shipping_notes')
                                        <span style="color: red; width: 100%">{{ $message }}</span>
                                    @enderror

                                    <input type="submit" value="Gửi" name="send_order" class="btn btn-primary btn-sm">
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </section>
    <!--/#cart_items-->
@endsection
