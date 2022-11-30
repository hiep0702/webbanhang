<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LoginRequest extends FormRequest
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
            'admin_email' => 'required|email',
            'admin_password' => 'required|min:6',
        ];
    }

    public function messages()
    {
        return [
            'admin_email.required' => 'Email không được để trống',
            'admin_email.email' => 'Email không đúng định dạng',
            'admin_password.required' => 'Mật khẩu không được để trống',
            'admin_password.min' => 'Mật khẩu tối thiểu phải đủ 6 ký tự',
        ];
    }
}
