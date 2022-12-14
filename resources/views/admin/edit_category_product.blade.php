 @extends('admin_layout')
 @section('admin_content')

 <div class="row">
        <div class="col-lg-12">
            <section class="panel">
                <header class="panel-heading">
                    Cập nhật danh mục sản phẩm
                </header>
                <div class="panel-body">
                    <?php
                        $message=Session::get('message');
                        if($message){
                            echo $message;
                            Session::put('message',null);
                        }


                    ?>
                    @foreach($edit_category_product as $key => $edit_value)
                    <div class="position-center">
                        <form role="form" action="{{URL::to('/update-category-product/'.$edit_value->category_id)}}" method="post">
                            {{csrf_field()}}
                            <div class="form-group">
                                <label for="exampleInputEmail1">Tên danh mục</label><br>
                                <input type="text" value="{{$edit_value->category_name}}" name="category_name" class="form-control" id="exampleInputEmail1" style="width: 100%;" >
                                @error('category_name')
                                     <span style="color: red; width: 100%">{{ $message }}</span>
                                 @enderror
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Mô tả danh mục</label><br>
                                <textarea name="category_desc" class="form-control" id="exampleInputPassword1" style="width: 100%;">{{$edit_value->category_desc}}</textarea>
                                @error('category_desc')
                                     <span style="color: red; width: 100%">{{ $message }}</span>
                                 @enderror
                            </div>
                           
                            
                            
                            <button type="submit" name="update_category_product" class="btn btn-info">Cập nhật danh mục</button>
                        </form>
                    </div>
                    @endforeach
                </div>
            </section>

        </div>
    </div>

@endsection