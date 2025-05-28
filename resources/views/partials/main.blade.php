<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Convera | {{ $title }}</title>
    <link rel="icon" type="image/x-icon" href="{{ asset('images/logo-16px.png') }}">
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/neumorphism.css') }}" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    @yield('import-css')
</head>

<body>
    @include('partials.share-modal')
    @include('partials.auth-modal')
    @include('partials.navbar')

    <div class="container">
        @include('partials.sidebar')

        <div class="main-content">
            @yield('main-content')
        </div>
    </div>

    <script src="{{ asset('js/auth.js') }}"></script>
    @yield('import-js')
</body>

</html>
