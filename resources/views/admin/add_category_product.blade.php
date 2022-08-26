 @extends('admin_layout')
 @section('admin_content')

 <div class="row">
        <div class="col-lg-12">
            <section class="panel">
                <header class="panel-heading">
                    Thêm danh mục sản phẩm
                </header>
                <div class="panel-body">
                    <?php
                        $message=Session::get('message');
                        if($message){
                            echo $message;
                            Session::put('message',null);
                        }


                    ?>
                    <div class="position-center">
                        <form role="form" action="{{URL::to('/save-category-product')}}" method="post">
                            {{csrf_field()}}
                            <div class="form-group">
                                <label for="exampleInputEmail1">Tên danh mục</label><br>
                                <input type="text" name="category_product_name" class="form-control" id="exampleInputEmail1" style="width: 100%;" >
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Mô tả danh mục</label><br>
                                <textarea name="category_product_desc" class="form-control" id="exampleInputPassword1" style="width: 100%;"></textarea>
                            </div>
                            <!-- <div class="form-group">
                                <label for="exampleInputPassword1">Từ khóa danh mục</label><br>
                                <textarea name="category_product_keywords" class="form-control" id="exampleInputPassword1" style="width: 100%;"></textarea>
                            </div> -->
                            <div class="form-group">
                                <label for="exampleInputPassword1">Hiển thị</label>
                                <select name="category_product_status" class="form-control input-sm m-bot15">
                                    <option value="0">Hiển thị</option>
                                    <option value="1">Ẩn</option>
                                </select>
                            </div>
                            
                            <button type="submit" name="add_category_product" class="btn btn-info">Thêm danh mục</button>
                        </form>
                    </div>

                </div>
            </section>

        </div>
    </div>

@endsection