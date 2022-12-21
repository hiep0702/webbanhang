@extends('layouts')
@section('content')
    <div class="features_items">
        <!--features_items-->
        <h2 class="title text-center">Kết quả tìm kiếm </h2>
        @foreach ($search_product as $key => $product)
            <div class="col-sm-4">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <a href="{{URL::to('/chi-tiet-san-pham/'.$product->product_id)}}">
                            <img src="{{ URL::to('public/uploads/product/' . $product->product_image) }}" width="150"
                                height="200" alt="" />
                            <h2>{{ number_format($product->product_price) . ' ' . 'VNĐ' }}</h2>
                            <p>{{ $product->product_name }}</p>
                            {{-- <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm giỏ hàng</a> --}}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
    <!--features_items-->
@endsection
