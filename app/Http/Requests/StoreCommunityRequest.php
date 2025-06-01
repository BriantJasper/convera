<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreCommunityRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:255', 'unique:communities'],
            'description' => ['required', 'string', 'min:10', 'max:1000'],
            'avatar' => ['nullable', 'image', 'max:2048'], // max 2MB
            'tags' => ['nullable', 'string', 'max:255'],
            'is_private' => ['boolean'],
        ];
    }

    /**
     * Get custom messages for validator errors.
     *
     * @return array
     */
    public function messages(): array
    {
        return [
            'name.required' => 'Please enter a community name',
            'name.unique' => 'This community name is already taken',
            'description.required' => 'Please provide a description for your community',
            'description.min' => 'Description must be at least 10 characters long',
            'avatar.image' => 'The file must be an image',
            'avatar.max' => 'The image size must not exceed 2MB',
        ];
    }
}
