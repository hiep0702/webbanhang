<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LoginCustomer extends FormRequest
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
            'customer_email' => 'required|email',
            'customer_password' => 'required|min:6',
        ];
    }

    public function messages()
    {
        return [
            'customer_email.required' => 'Email không được để trống',
            'customer_email.email' => 'Email không đúng định dạng',

            'customer_password.required' => 'Mật khẩu không được để trống',
            'customer_password.min' => 'Mật khẩu tối thiểu phải đủ 6 ký tự',
        ];
    }
}
