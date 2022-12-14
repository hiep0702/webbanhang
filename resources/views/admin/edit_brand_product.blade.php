 @extends('admin_layout')
 @section('admin_content')
     <div class="row">
         <div class="col-lg-12">
             <section class="panel">
                 <header class="panel-heading">
                     Cập nhật thương hiệu sản phẩm
                 </header>
                 <div class="panel-body">
                     <?php
                     $message = Session::get('message');
                     if ($message) {
                         echo $message;
                         Session::put('message', null);
                     }
                     
                     ?>
                     @foreach ($edit_brand_product as $key => $edit_value)
                         <div class="position-center">
                             <form role="form" action="{{ URL::to('/update-brand-product/' . $edit_value->brand_id) }}"
                                 method="post">
                                 {{ csrf_field() }}
                                 <div class="form-group">
                                     <label for="exampleInputEmail1">Tên thương hiệu</label><br>
                                     <input type="text" value="{{ $edit_value->brand_name }}" name="brand_name"
                                         class="form-control" id="exampleInputEmail1" style="width: 100%;">
                                     @error('brand_name')
                                         <span style="color: red; width: 100%">{{ $message }}</span>
                                     @enderror
                                 </div>
                                 <div class="form-group">
                                     <label for="exampleInputPassword1">Mô tả thương hiệu</label><br>
                                     <textarea name="brand_desc" class="form-control" id="exampleInputPassword1" style="width: 100%;">{{ $edit_value->brand_desc }}</textarea>
                                     @error('brand_desc')
                                         <span style="color: red; width: 100%">{{ $message }}</span>
                                     @enderror
                                 </div>
                                 <button type="submit" name="update_brand_product" class="btn btn-info">Cập nhật thương hiệu</button>
                             </form>
                         </div>
                     @endforeach

                 </div>
             </section>

         </div>
     </div>
 @endsection
