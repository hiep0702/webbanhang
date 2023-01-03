<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderModel extends Model
{
    use HasFactory;

    protected $table = 'tbl_order';
    
    protected $primaryKey = 'order_id';
    
    protected $fillable = [
        'customer_id', 
        'shipping_id', 
        'payment_id', 
        'order_total', 
        'order_status'
    ];

    public $timestamps = false;

    public function orderDetail()
    {
        return $this->hasOne(OrdelDetail::class,'order_id');
    }
}
