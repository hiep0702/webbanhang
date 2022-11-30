<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateProduct extends FormRequest
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
            'product_name' => 'required|min:6|max:255',
            'product_price' => 'required|numeric',
            'product_desc' => 'required',
            'product_content' => 'required',
        ];
    }

    public function messages()
    {
        return [
            'product_name.required' => 'Tên sản phẩm không được để trống',
            'product_name.min' => 'Tên sản phẩm tối thiểu phải đủ 6 ký tự',
            'product_name.max' => 'Tên sản phẩm tối đa 255 ký tự',
            'product_price.required' => 'Giá sản phẩm không được để trống',
            'product_price.numeric' => 'Giá sản phẩm phải là số',
            'product_desc.required' => 'Mô tả sản phẩm không được để trống',
            'product_content.required' => 'Nội dung sản phẩm không được để trống',
        ];
    }
}
