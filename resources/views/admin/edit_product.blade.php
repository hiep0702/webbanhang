 @extends('admin_layout')
 @section('admin_content')
     <div class="row">
         <div class="col-lg-12">
             <section class="panel">
                 <header class="panel-heading">
                     Cập nhật sản phẩm
                 </header>
                 <div class="panel-body">
                     <?php
                     $message = Session::get('message');
                     if ($message) {
                         echo $message;
                         Session::put('message', null);
                     }
                     
                     ?>
                     <div class="position-center">
                         @foreach ($edit_product as $key => $pro)
                             <form role="form" action="{{ URL::to('/update-product/' . $pro->product_id) }}" method="post"
                                 enctype="multipart/form-data">
                                 {{ csrf_field() }}
                                 <div class="form-group">
                                     <label for="exampleInputEmail1">Tên sản phẩm</label><br>
                                     <input type="text" name="product_name" class="form-control" id="exampleInputEmail1"
                                         style="width: 100%;" value="{{ $pro->product_name }}">
                                     @error('product_name')
                                         <span style="color: red; width: 100%">{{ $message }}</span>
                                     @enderror
                                 </div>
                                 <div class="form-group">
                                     <label for="exampleInputEmail1">Giá sản phẩm</label><br>
                                     <input type="text" name="product_price" class="form-control" id="exampleInputEmail1"
                                         style="width: 100%;" value="{{ $pro->product_price }}">
                                     @error('product_price')
                                         <span style="color: red; width: 100%">{{ $message }}</span>
                                     @enderror
                                 </div>
                                 <div class="form-group">
                                     <label for="exampleInputEmail1">Hình ảnh sản phẩm</label><br>
                                     <input type="file" name="product_image" class="form-control" id="exampleInputEmail1"
                                         style="width: 100%;" value="{{ $pro->product_image }}>
                                     <img src="{{ URL::to('public/uploads/product/' . $pro->product_image) }}"
                                         height="100" width="100">
                                 </div>
                                 <div class="form-group">
                                     <label for="exampleInputPassword1">Mô tả sản phẩm</label><br>
                                     <textarea name="product_desc" class="form-control" id="exampleInputPassword1" style="width: 100%;">{{ $pro->product_desc }}</textarea>
                                     @error('product_desc')
                                         <span style="color: red; width: 100%">{{ $message }}</span>
                                     @enderror
                                 </div>
                                 <div class="form-group">
                                     <label for="exampleInputPassword1">Nội dung sản phẩm</label><br>
                                     <textarea name="product_content" class="form-control" id="exampleInputPassword1" style="width: 100%;">{{ $pro->product_content }}</textarea>
                                     @error('product_content')
                                         <span style="color: red; width: 100%">{{ $message }}</span>
                                     @enderror
                                 </div>
                                 <div class="form-group">
                                     <label for="exampleInputPassword1">Danh mục sản phẩm</label>
                                     <select name="product_cate" class="form-control input-sm m-bot15">
                                         @foreach ($cate_product as $key => $cate)
                                             @if ($cate->category_id)
                                                 ==$pro->category_id
                                                 <option selected value="{{ $cate->category_id }}">
                                                     {{ $cate->category_name }}</option>
                                             @else
                                                 <option value="{{ $cate->category_id }}">{{ $cate->category_name }}
                                                 </option>
                                             @endif
                                         @endforeach
                                     </select>
                                 </div>
                                 <div class="form-group">
                                     <label for="exampleInputPassword1">Danh mục thương hiệu</label>
                                     <select name="product_brand" class="form-control input-sm m-bot15">
                                         @foreach ($brand_product as $key => $brand)
                                             @if ($cate->category_id == $pro->category_id)
                                                 <option selected value="{{ $brand->brand_id }}">{{ $brand->brand_name }}
                                                 </option>
                                             @else
                                                 <option value="{{ $brand->brand_id }}">{{ $brand->brand_name }}</option>
                                             @endif
                                         @endforeach
                                     </select>
                                 </div>
                                 <div class="form-group">
                                     <label for="exampleInputPassword1">Hiển thị</label>
                                     <select name="product_status" class="form-control input-sm m-bot15">
                                         <option value="0">Hiển thị</option>
                                         <option value="1">Ẩn</option>
                                     </select>
                                 </div>

                                 <button type="submit" name="add_product" class="btn btn-info">Cập nhật sản phẩm</button>
                             </form>
                         @endforeach
                     </div>

                 </div>
             </section>

         </div>
     </div>
 @endsection
