<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateCustomer extends FormRequest
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
            'customer_name' => 'required|min:6|max:255',
            'customer_email' => 'required|email',
            'customer_password' => 'required|min:6',
            'customer_address' => 'required',
            'customer_phone' => 'required|numeric|digits:10',
        ];
    }

    public function messages()
    {
        return [
            'customer_name.required' => 'Tên không được để trống',
            'customer_name.min' => 'Tên tối thiểu phải đủ 6 ký tự',
            'customer_name.max' => 'Tên không được vượt quá 255 ký tự',

            'customer_email.required' => 'Email không được để trống',
            'customer_email.email' => 'Email không đúng định dạng',

            'customer_password.required' => 'Mật khẩu không được để trống',
            'customer_password.min' => 'Mật khẩu tối thiểu phải đủ 6 ký tự',

            'customer_address.required' => 'Địa chỉ không được để trống',

            'customer_phone.required' => 'Số điện thoại không được để trống',
            'customer_phone.numeric' => 'Số điện thoại không hợp lệ',
            'customer_phone.digits' => 'Số điện thoại phải đủ 10 số',
        ];
    }
}
