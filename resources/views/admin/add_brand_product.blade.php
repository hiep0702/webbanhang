 @extends('admin_layout')
 @section('admin_content')
     <div class="row">
         <div class="col-lg-12">
             <section class="panel">
                 <header class="panel-heading">
                     Thêm thương hiệu sản phẩm
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
                         <form role="form" action="{{ URL::to('/save-brand-product') }}" method="post">
                             {{ csrf_field() }}
                             <div class="form-group">
                                 <label for="exampleInputEmail1">Tên thương hiệu</label><br>
                                 <input type="text" name="brand_name" class="form-control"
                                     id="exampleInputEmail1" style="width: 100%;">
                                 @error('brand_name')
                                     <span style="color: red; width: 100%">{{ $message }}</span>
                                 @enderror
                             </div>
                             <div class="form-group">
                                 <label for="exampleInputPassword1">Mô tả thương hiệu</label><br>
                                 <textarea name="brand_desc" class="form-control" id="exampleInputPassword1" style="width: 100%;"></textarea>
                                 @error('brand_desc')
                                     <span style="color: red; width: 100%">{{ $message }}</span>
                                 @enderror
                             </div>
                             <div class="form-group">
                                 <label for="exampleInputPassword1">Hiển thị</label>
                                 <select name="brand_status" class="form-control input-sm m-bot15">
                                     <option value="0">Hiển thị</option>
                                     <option value="1">Ẩn</option>
                                 </select>
                             </div>

                             <button type="submit" name="add_brand_product" class="btn btn-info">Thêm thương hiệu</button>
                         </form>
                     </div>

                 </div>
             </section>

         </div>
     </div>
 @endsection
