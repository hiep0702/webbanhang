<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SaveCustomerRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'shipping_name' => 'required',
            'shipping_phone' => 'required|numeric|digits:10',
            'shipping_email' => 'required|email',
            'shipping_notes' => 'required',
            'shipping_address' => 'required',
        ];
    }

    public function messages()
    {
        return [
            'shipping_name.required' => 'Họ và tên không được để trống',

            'shipping_phone.required' => 'Số điện thoại không được để trống',
            'shipping_phone.numeric' => 'Số điện thoại không hợp lệ',
            'shipping_phone.digits' => 'Số điện thoại phải đủ 10 số',

            'shipping_email.required' => 'Email không được để trống',
            'shipping_email.email' => 'Email không đúng định dạng',

            'shipping_notes.required' => 'Ghi chú không được để trống',

            'shipping_address.required' => 'Địa chỉ không được để trống',
        ];
    }
}
