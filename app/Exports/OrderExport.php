<?php

namespace App\Exports;

use App\Models\OrderDetail;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class OrderExport implements FromCollection,WithHeadings,WithMapping
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        $order = DB::table('tbl_order')
        ->join('tbl_customers', 'tbl_order.customer_id', 'tbl_customers.customer_id')
        ->join('tbl_order_details', 'tbl_order.order_id', 'tbl_order_details.order_id')
        ->select('tbl_order.*', 'tbl_customers.*', 'tbl_order_details.*')->get();

        return $order;
    }

    public function headings(): array {
        return [
            'Mã đơn hàng',
            'Tên sản phẩm',
            'Giá sản phẩm',     
            'Số lượng',    
            'Trạng thái',
            'Tên khách hàng',
            'Email',
            'Địa chỉ',
            'SDT',
        ];
    }
 
    public function map($order): array {
        return [
            $order->order_id,
            $order->product_name,
            $order->product_price,
            $order->product_sales_quantity,
            $order->order_status,
            $order->customer_name,
            $order->customer_email,
            $order->customer_address,
            $order->customer_phone,
        ];
    }
}
