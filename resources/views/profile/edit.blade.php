@extends('partials.main')

@section('import-css')
    <link rel="stylesheet" href="{{ asset('css/profile-edit.css') }}">
    <link rel="stylesheet" href="{{ asset('css/notification.css') }}">
@endsection

@section('main-content')
    @if (session('status') === 'profile-updated')
        <div class="notification" data-type="success" style="display: none;">
            <span class="message">Profile updated successfully!</span>
        </div>
    @endif

    @if (session('error'))
        <div class="notification" data-type="error" style="display: none;">
            <span class="message">{{ session('error') }}</span>
        </div>
    @endif

    <div class="profile-edit-container">
        <h2>{{ __('Edit Profile') }}</h2>

        <div class="space-y-6">
            <div class="p-4 sm:p-8 bg-white dark:bg-gray-800 shadow sm:rounded-lg">
                <div class="max-w-xl">
                    @include('profile.partials.update-profile-information-form')
                </div>
            </div>

            <div class="p-4 sm:p-8 bg-white dark:bg-gray-800 shadow sm:rounded-lg">
                <div class="max-w-xl">
                    @include('profile.partials.update-password-form')
                </div>
            </div>

            <div class="p-4 sm:p-8 bg-white dark:bg-gray-800 shadow sm:rounded-lg">
                <div class="max-w-xl">
                    @include('profile.partials.delete-user-form')
                </div>
            </div>
        </div>
    </div>
@endsection

@section('import-js')
    <script src="{{ asset('js/notification.js') }}"></script>
@endsection
