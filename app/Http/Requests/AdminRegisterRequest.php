<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AdminRegisterRequest extends FormRequest
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
            'admin_name' => 'required|min:6',
            'admin_email' => 'required|email|unique:tbl_admin',
            'admin_password' => 'required|min:6',
            'admin_phone' => 'required|numeric|digits:10',
        ];
    }

    public function messages()
    {
        return [
            'admin_name.required' => 'Họ tên không được để trống',
            'admin_name.min' => 'Họ tên tối thiểu phải đủ 6 ký tự',
            'admin_email.required' => 'Email không được để trống',
            'admin_email.email' => 'Email không đúng định dạng',
            'admin_email.unique' => 'Email đã tồn tại',
            'admin_password.required' => 'Mật khẩu không được để trống',
            'admin_password.min' => 'Mật khẩu tối thiểu phải đủ 6 ký tự',
            'admin_phone.required' => 'Số điện thoại không được để trống',
            'admin_phone.numeric' => 'Số điện thoại phải là số tự nhiên',
            'admin_phone.digits' => 'Số điện thoại phải là số tự nhiên và đủ 10 số',
        ];
    }
}
