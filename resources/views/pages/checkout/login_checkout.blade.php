@extends('layouts')
@section('content')
    <section id="form">
        <!--form-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4 col-sm-offset-1">
                    <div class="login-form">
                        <!--login form-->
                        <h2>Đăng nhập tài khoản của bạn</h2>
                        <form action="{{ URL::to('/login-customer') }}" method="POST">
                            {{ csrf_field() }}
                            <div>
                                <?php
                                $message = Session::get('message');
                                if ($message) {
                                    echo $message;
                                    Session::put('message', null);
                                }
                                
                                ?>
                            </div>
                            <div>
                                @error('customer_email')
                                <span style="color: red; width: 100%">{{ $message }}</span>
                                @enderror
                                <input type="text" name="customer_email" placeholder="Tài khoản" />
                            </div>
                            <div>
                                @error('customer_password')
                                <span style="color: red; width: 100%">{{ $message }}</span>
                                @enderror
                                <input type="password" name="customer_password" placeholder="Password" />
                            </div>
                            {{-- <span>
                                <input type="checkbox" class="checkbox">
                                Ghi nhớ đăng nhập
                            </span> --}}
                            <button type="submit" class="btn btn-default">Đăng nhập</button>
                        </form>
                    </div>
                    <!--/login form-->
                </div>
                <div class="col-sm-1">
                    <h2 class="or">OR</h2>
                </div>
                <div class="col-sm-4">
                    <div class="signup-form">
                        <!--sign up form-->
                        <h2>Đăng ký</h2>
                        <form action="{{ URL::to('/add-customer') }}" method="POST">
                            {{ csrf_field() }}
                            <div>
                                @error('customer_name')
                                    <span style="color: red; width: 100%">{{ $message }}</span>
                                @enderror
                                <input type="text" name="customer_name" placeholder="Họ và tên" />
                            </div>
                            <div>
                                @error('customer_email')
                                    <span style="color: red; width: 100%">{{ $message }}</span>
                                @enderror
                                <input type="text" name="customer_email" placeholder="Địa chỉ email" />                                
                            </div>
                            <div>
                                @error('customer_password')
                                    <span style="color: red; width: 100%">{{ $message }}</span>
                                @enderror
                                <input type="password" name="customer_password" placeholder="Mật khẩu" />                               
                            </div>
                            <div>
                                @error('customer_address')
                                <span style="color: red; width: 100%">{{ $message }}</span>
                                @enderror
                                <input type="text" name="customer_address" placeholder="Địa chỉ" />
                            </div>
                            <div>
                                @error('customer_phone')
                                <span style="color: red; width: 100%">{{ $message }}</span>
                                @enderror
                                <input type="text" name="customer_phone" placeholder="Phone" />
                            </div>
                            <button type="submit" class="btn btn-default">Đăng ký</button>
                        </form>
                    </div>
                    <!--/sign up form-->
                </div>
            </div>
        </div>
    </section>
    <!--/form-->
@endsection
