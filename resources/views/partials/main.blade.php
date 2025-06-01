<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Convera | {{ $title }}</title>
    <link rel="icon" type="image/x-icon" href="{{ asset('images/logo-16px.png') }}">
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/neumorphism.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/share-modal.css') }}">
    <link rel="stylesheet" href="{{ asset('css/notification.css') }}" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    @yield('import-css')
</head>

<body>
    @include('partials.auth-modal')
    @include('partials.navbar')
    @include('components.share-modal')
    <div class="container">
        @include('partials.sidebar')

        <div class="main-content">
            @if (session('notification'))
                <div class="notification {{ session('notificationType') }}"
                    data-type="{{ session('notificationType') }}">
                    <span class="message">{{ session('notification') }}</span>
                    <button class="close-btn">&times;</button>
                </div>
            @endif
            @yield('main-content')
        </div>
    </div>
    <script src="{{ asset('js/share-modal.js') }}"></script>
    <script src="{{ asset('js/auth.js') }}"></script>
    <script src="{{ asset('js/notification.js') }}"></script>

    @yield('import-js')
</body>

</html>
