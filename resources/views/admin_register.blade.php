<!DOCTYPE html>
<head>
    <title>admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- bootstrap-css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- //bootstrap-css -->
    <!-- Custom CSS -->
    <link href="{{ asset('public/backend/css/style.css') }}" rel='stylesheet' type='text/css' />
    <link href="{{ asset('public/backend/css/style-responsive.css') }}" rel="stylesheet" />
    <!-- font CSS -->
    <link
        href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic'
        rel='stylesheet' type='text/css'>
    <!-- font-awesome icons -->
    <link rel="stylesheet" href="{{ asset('public/backend/css/font.css') }}" type="text/css" />
    <link href="{{ asset('public/backend/css/font-awesome.css') }}" rel="stylesheet">
    <!-- //font-awesome icons -->
    <script src="js/jquery2.0.3.min.js"></script>
</head>

<body>
    <div class="log-w3">
        <div class="w3layouts-main">
            <h2>Đăng kí</h2>
            <?php
            $message = Session::get('message');
            if ($message) {
                echo "<p>$message</p>";
                Session::put('message', null);
            }
            
            ?>
            <form action="{{ URL::to('/admin-signup') }}" method="post">
                {{ csrf_field() }}
                <div>
                    <label for="">Họ tên:</label>
                    <input class="ggg" name="admin_name" placeholder="Nhập họ và tên ...">
                    @error('admin_name')
                        <i style="color: red; width: 100%">{{ $message }}</i>
                    @enderror
                </div>
                <div>
                    <label for="">Email:</label>
                    <input class="ggg" name="admin_email" placeholder="Nhập email ..." type="email">
                    @error('admin_email')
                        <i style="color: red; width: 100%">{{ $message }}</i>
                    @enderror
                </div>
                <div>
                    <label for="">Mật khẩu:</label>
                    <input type="password" class="ggg" name="admin_password" placeholder="Nhập mật khẩu ...">
                    @error('admin_password')
                        <i style="color: red; width: 100%">{{ $message }}</i>
                    @enderror
                </div>
                <div>
                    <label for="">Số điện thoại:</label>
                    <input class="ggg" name="admin_phone" placeholder="Nhập số điện thoại ..." type="">
                    @error('admin_phone')
                        <i style="color: red; width: 100%">{{ $message }}</i>
                    @enderror
                </div>
                <div class="clearfix"></div>
                <input type="submit" value="Đăng kí" name="register">
                <div>
                    <a style="color: revert;margin-left: 150px;" href="{{ route('admin-index') }}">Bạn đã có tài khoản?</a>
                </div>
            </form>
        </div>
    </div>
    <script src="{{ asset('public/backend/js/bootstrap.js') }}"></script>
    <script src="{{ asset('public/backend/js/jquery.dcjqaccordion.2.7.js') }}"></script>
    <script src="js/scripts.js')}}"></script>
    <script src="{{ asset('public/backend/js/jquery.slimscroll.js') }}"></script>
    <script src="{{ asset('public/backend/js/jquery.nicescroll.js') }}"></script>
    <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
    <script src="{{ asset('public/backend/js/jquery.scrollTo.js') }}"></script>
</body>

</html>
