<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\View\View;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    public function create(): View
    {
        return view('auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        try {
            $request->validate([
                'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:' . User::class],
                'password' => ['required', 'confirmed', Rules\Password::defaults()],
            ], [
                'password.confirmed' => 'The password confirmation does not match.',
                'password.required' => 'Please enter a password.',
                'email.required' => 'Please enter your email address.',
                'email.email' => 'Please enter a valid email address.',
                'email.unique' => 'This email is already registered.',
            ]);

            // Generate a placeholder name from email
            $emailParts = explode('@', $request->email);
            $baseName = $emailParts[0];
            $randomNumber = rand(1000, 9999);
            $placeholderName = $baseName . $randomNumber;

            $user = User::create([
                'name' => $placeholderName,
                'email' => $request->email,
                'password' => Hash::make($request->password),
            ]);

            event(new Registered($user));

            Auth::login($user);

            return redirect()->route('home')->with('success', 'Registration successful! Welcome to Convera.');
        } catch (\Illuminate\Validation\ValidationException $e) {
            return redirect()->route('home')
                ->withErrors($e->validator)
                ->withInput()
                ->with('openModal', 'register');
        }
    }
}
