 @extends('admin_layout')
 @section('admin_content')
     <div class="row">
         <div class="col-lg-12">
             <section class="panel">
                 <header class="panel-heading">
                     Thêm sản phẩm
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
                         <form role="form" action="{{ URL::to('/save-product') }}" method="post"
                             enctype="multipart/form-data">
                             {{ csrf_field() }}
                             <div class="form-group">
                                 <label for="exampleInputEmail1">Tên sản phẩm</label><br>
                                 <input type="text" name="product_name" class="form-control" id="exampleInputEmail1"
                                     style="width: 100%;">
                                 @error('product_name')
                                     <span style="color: red; width: 100%">{{ $message }}</span>
                                 @enderror
                             </div>
                             <div class="form-group">
                                 <label for="exampleInputEmail1">Giá sản phẩm</label><br>
                                 <input type="text" name="product_price" class="form-control" id="exampleInputEmail1"
                                     style="width: 100%;">
                                 @error('product_price')
                                     <span style="color: red; width: 100%">{{ $message }}</span>
                                 @enderror
                             </div>
                             <div class="form-group">
                                <label for="exampleInputEmail1">Số lượng</label><br>
                                <input type="text" name="product_quantity" class="form-control" id="exampleInputEmail1"
                                    style="width: 100%;">
                                @error('product_quantity')
                                    <span style="color: red; width: 100%">{{ $message }}</span>
                                @enderror
                            </div>
                             <div class="form-group">
                                 <label for="exampleInputEmail1">Hình ảnh sản phẩm</label><br>
                                 <input type="file" name="product_image" class="form-control" id="exampleInputEmail1"
                                     style="width: 100%;">
                                 @error('product_image')
                                     <span style="color: red; width: 100%">{{ $message }}</span>
                                 @enderror
                             </div>
                             <div class="form-group">
                                 <label for="exampleInputPassword1">Mô tả sản phẩm</label><br>
                                 <textarea name="product_desc" class="form-control" id="ckediter" style="width: 100%;"></textarea>
                                 @error('product_desc')
                                     <span style="color: red; width: 100%">{{ $message }}</span>
                                 @enderror
                             </div>
                             <div class="form-group">
                                 <label for="exampleInputPassword1">Nội dung sản phẩm</label><br>
                                 <textarea name="product_content" class="form-control" id="ckediter1" style="width: 100%;"></textarea>
                                 @error('product_content')
                                     <span style="color: red; width: 100%">{{ $message }}</span>
                                 @enderror
                             </div>
                             <div class="form-group">
                                 <label for="exampleInputPassword1">Danh mục sản phẩm</label>
                                 <select name="product_cate" class="form-control input-sm m-bot15">
                                     @foreach ($cate_product as $key => $cate)
                                         <option value="{{ $cate->category_id }}">{{ $cate->category_name }}</option>
                                     @endforeach
                                 </select>
                             </div>
                             <div class="form-group">
                                 <label for="exampleInputPassword1">Danh mục thương hiệu</label>
                                 <select name="product_brand" class="form-control input-sm m-bot15">
                                     @foreach ($brand_product as $key => $brand)
                                         <option value="{{ $brand->brand_id }}">{{ $brand->brand_name }}</option>
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

                             <button type="submit" name="add_product" class="btn btn-info">Thêm sản phẩm</button>
                         </form>
                     </div>

                 </div>
             </section>

         </div>
     </div>
 @endsection
