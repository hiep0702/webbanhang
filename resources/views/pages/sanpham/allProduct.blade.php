@extends('layouts')
@section('content')
    @foreach ($allProduct as $allProd)
        <div class="col-sm-4">
            <div class="product-image-wrapper">
                <div class="single-products">
                    <div class="productinfo text-center">
                        <form>
                            @csrf
                            <input type="hidden" value="{{ $allProd->product_id }}"
                                class="cart_product_id_{{ $allProd->product_id }}">
                            <input type="hidden" value="{{ $allProd->product_name }}"
                                class="cart_product_name_{{ $allProd->product_id }}">
                            <input type="hidden" value="{{ $allProd->product_image }}"
                                class="cart_product_image_{{ $allProd->product_id }}">
                            <input type="hidden" value="1" class="cart_product_qty_{{ $allProd->product_id }}">
                            <a href="{{ URL::to('/chi-tiet-san-pham/' . $allProd->product_id) }}">
                                <img src="{{ URL::to('public/uploads/product/' . $allProd->product_image) }}" width="150"
                                    height="200" margin-right="50px" alt="" />
                                <h2>{{ number_format($allProd->product_price) . ' ' . 'VNĐ' }}</h2>
                                <p>{{ $allProd->product_name }}</p>
                            </a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    @endforeach
    <div style="text-align: center;">
        {{ $allProduct->links() }}
    </div>
@endsection
