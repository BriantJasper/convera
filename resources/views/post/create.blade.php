@extends('partials.main')

@section('import-css')
    <link rel="stylesheet" href="{{ asset('css/post-create.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">
@endsection

@section('main-content')
    <div class="container">
        <div class="create-post-container">
            <div class="post-header">
                <h1>Create a New Post</h1>
                <p>Share your thoughts with the community</p>
            </div>

            <form action="{{ route('posts.store') }}" method="POST" id="postForm">
                @csrf
                <div class="community-selector">
                    <label for="community">Select Community</label>
                    <div class="select-wrapper">
                        <select id="community" name="community_id" class="community-select" required>
                            <option value="">Search for a community...</option>
                            @foreach ($communities as $community)
                                <option value="{{ $community->id }}">{{ $community->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    @error('community_id')
                        <div class="error-message">{{ $message }}</div>
                    @enderror
                </div>

                <div class="post-tabs">
                    <div class="post-tab active" data-type="text">
                        <i class="fa fa-file-text"></i> Text
                    </div>
                    <div class="post-tab" data-type="image">
                        <i class="fa fa-image"></i> Image
                    </div>
                    <div class="post-tab" data-type="link">
                        <i class="fa fa-link"></i> Link
                    </div>
                </div>

                <div class="form-group">
                    <input type="text" id="postTitle" name="title" placeholder="Title" required
                        value="{{ old('title') }}" />
                    @error('title')
                        <div class="error-message">{{ $message }}</div>
                    @enderror
                </div>

                <div class="form-group">
                    <div class="formatting-bar">
                        <button type="button" class="format-btn" data-format="bold">
                            <i class="fa fa-bold"></i>
                        </button>
                        <button type="button" class="format-btn" data-format="italic">
                            <i class="fa fa-italic"></i>
                        </button>
                        <button type="button" class="format-btn" data-format="list">
                            <i class="fa fa-list-ul"></i>
                        </button>
                        <button type="button" class="format-btn" data-format="ordered-list">
                            <i class="fa fa-list-ol"></i>
                        </button>
                        <button type="button" class="format-btn" data-format="code">
                            <i class="fa fa-code"></i>
                        </button>
                    </div>
                    <textarea id="postContent" name="content" placeholder="What's on your mind?" required>{{ old('content') }}</textarea>
                    @error('content')
                        <div class="error-message">{{ $message }}</div>
                    @enderror
                </div>

                <div class="post-buttons">
                    <button type="submit" class="post-btn post-submit">Post</button>
                    <button type="button" class="post-btn post-draft">Save as Draft</button>
                </div>
            </form>
        </div>
    </div>
@endsection

@section('import-js')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <script src="{{ asset('js/post-create.js') }}"></script>
@endsection
