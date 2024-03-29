<?php

namespace App\Http\Controllers;

use App\Exports\OrderExport;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\CreateCustomer;
use App\Http\Requests\LoginCustomer;
use App\Http\Requests\SaveCustomerRequest;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
use Maatwebsite\Excel\Facades\Excel;

session_start();
class CheckoutController extends Controller
{
    public function AuthLogin()
    {
        $admin_id = Session::get('admin_id');
        if ($admin_id) {
            return Redirect::to('admin.dashboard');
        } else {
            return Redirect::to('admin')->send();
        }
    }
    public function view_order($orderId)
    {
        $this->AuthLogin();
        $order_by_id = DB::table('tbl_order')
            ->join('tbl_customers', 'tbl_order.customer_id', 'tbl_customers.customer_id')
            ->join('tbl_order_details', 'tbl_order.order_id', 'tbl_order_details.order_id')
            ->select('tbl_order.*', 'tbl_customers.*', 'tbl_order_details.*')
            ->where('tbl_order.order_id', $orderId)->get();
        return view('admin.view_order', compact('order_by_id'));
    }

    public function export()
    {
        return Excel::download(new OrderExport, 'Thông tin đơn hàng.xlsx');
    }

    public function login_checkout()
    {
        $cate_product = DB::table('tbl_category_product')->where('category_status', '0')->orderby('category_id', 'desc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status', '0')->orderby('brand_id', 'desc')->get();
        return view('pages.checkout.login_checkout')->with('category', $cate_product)->with('brand', $brand_product);
    }
    public function add_customer(CreateCustomer $request)
    {
        $data = array();
        $data['customer_name'] = $request->customer_name;
        $data['customer_email'] = $request->customer_email;
        $data['customer_password'] = md5($request->customer_password);
        $data['customer_address'] = $request->customer_address;
        $data['customer_phone'] = $request->customer_phone;

        $customer_id = DB::table('tbl_customers')->insertGetId($data);
        Session::put('customer_id', $customer_id);
        Session::put('customer_name', $request->customer_name);
        return Redirect::to('/checkout');
    }
    public function checkout()
    {
        $cate_product = DB::table('tbl_category_product')->where('category_status', '0')->orderby('category_id', 'desc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status', '0')->orderby('brand_id', 'desc')->get();
        return view('pages.checkout.show_checkout')->with('category', $cate_product)->with('brand', $brand_product);
    }
    public function save_checkout_customer(SaveCustomerRequest $request)
    {
        $data = array();
        $data['shipping_name'] = $request->shipping_name;
        $data['shipping_phone'] = $request->shipping_phone;
        $data['shipping_email'] = $request->shipping_email;
        $data['shipping_notes'] = $request->shipping_notes;
        $data['shipping_address'] = $request->shipping_address;

        $shipping_id = DB::table('tbl_shipping')->insertGetId($data);
        Session::put('shipping_id', $shipping_id);

        return Redirect::to('/payment');
    }
    public function payment()
    {
        $cate_product = DB::table('tbl_category_product')->where('category_status', '0')->orderby('category_id', 'desc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status', '0')->orderby('brand_id', 'desc')->get();
        return view('pages.checkout.payment')->with('category', $cate_product)->with('brand', $brand_product);
    }
    public function order_place(Request $request)
    {
        //insert payment_method
        $data = array();
        $data['payment_method'] = $request->payment_option;
        $data['payment_status'] = 'Đang chờ xử lý';
        $payment_id = DB::table('tbl_payment')->insertGetId($data);
        //insert ordeer
        $order_data = array();
        $order_data['customer_id'] = Session::get('customer_id');
        $order_data['shipping_id'] = Session::get('shipping_id');
        $order_data['payment_id'] = $payment_id;
        $order_data['order_total'] = Cart::total();
        $order_data['order_status'] = 'Đang chờ xử lý';

        $order_id = DB::table('tbl_order')->insertGetId($order_data);

        //insert order_details
        $content = Cart::content();
        foreach ($content as $key => $v_content) {
            $order_d_data = array();
            $order_d_data['order_id'] = $order_id;
            $order_d_data['product_id'] = $v_content->id;
            $order_d_data['product_name'] = $v_content->name;
            $order_d_data['product_price'] = $v_content->price;
            $order_d_data['product_sales_quantity'] = $v_content->qty;
            DB::table('tbl_order_details')->insert($order_d_data);
        }

        if ($data['payment_method'] == 1) {
            echo "Thanh toán thẻ ATM";
            echo "</br>";
            echo "Cảm ơn quý khách đã sử dụng dịch vụ của chúng tôi!!!";
        } elseif ($data['payment_method'] == 2) {
            Cart::destroy();
            $cate_product = DB::table('tbl_category_product')->where('category_status', '0')->orderby('category_id', 'desc')->get();
            $brand_product = DB::table('tbl_brand')->where('brand_status', '0')->orderby('brand_id', 'desc')->get();
            return view('pages.checkout.handcash')->with('category', $cate_product)->with('brand', $brand_product);
        } else {
            echo "Thanh toán Paypal";
            echo "</br>";
            echo "Cảm ơn quý khách đã sử dụng dịch vụ của chúng tôi!!!";
        }

        // return Redirect::to('/order-place');
    }
    public function logout_checkout()
    {
        Session::flush();
        return Redirect::to('/login-checkout');
    }
    public function login_customer(LoginCustomer $request)
    {
        $email = $request->customer_email;
        $password = md5($request->customer_password);
        $result = DB::table('tbl_customers')->where('customer_email', $email)->where('customer_password', $password)->first();
        if ($result) {
            Session::put('customer_id', $result->customer_id);
            Session::put('message', 'Đăng nhập thành công');
            return Redirect::to('/checkout');
        } else {
            Session::put('message', 'Email hoặc mật khẩu của bạn không đúng. Vui lòng kiểm tra lại');
            return Redirect::to('/login-checkout');
        }
    }
    public function manager_order()
    {
        $this->AuthLogin();
        $all_order = DB::table('tbl_order')
            ->join('tbl_customers', 'tbl_order.customer_id', '=', 'tbl_customers.customer_id')
            ->select('tbl_order.*', 'tbl_customers.customer_name')->orderby('tbl_order.order_id', 'desc')->paginate(5);
        $manager_order = view('admin.manager_order')->with('all_order', $all_order);
        return view('admin_layout')->with('admin.manager_order', $manager_order);
    }

    public function delete_order($order_id)
    {
        $this->AuthLogin();
        Db::table('tbl_order')->where('order_id', $order_id)->delete();
        Session::put('message', 'Xóa danh mục sản phẩm thành công');
        return Redirect::to('manager-order');
    }
}
