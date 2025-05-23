@extends('partials.main')
@dd($tag)
@section('container')
    <h1>Tags Pages</h1>
    <h2>{{ $tag->name }}</h2>
    
@endsection
