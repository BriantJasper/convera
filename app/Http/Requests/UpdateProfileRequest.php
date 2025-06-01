<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateProfileRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', Rule::unique('users')->ignore($this->user()->id)],
            'bio' => ['nullable', 'string', 'max:1000'],
            'work' => ['nullable', 'string', 'max:255'],
            'education' => ['nullable', 'string', 'max:255'],
            'location' => ['nullable', 'string', 'max:255'],
            'website' => ['nullable', 'url', 'max:255'],
            'avatar' => ['nullable', 'image', 'max:2048'], // max 2MB
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'Please enter your name',
            'email.required' => 'Please enter your email address',
            'email.email' => 'Please enter a valid email address',
            'email.unique' => 'This email address is already taken',
            'bio.max' => 'Bio cannot be longer than 1000 characters',
            'website.url' => 'Please enter a valid URL',
            'avatar.image' => 'The file must be an image',
            'avatar.max' => 'The image size must not exceed 2MB',
        ];
    }
}
