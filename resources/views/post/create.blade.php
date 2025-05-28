@extends('partials.main')

@section('import-css')
    <link rel="stylesheet" href="{{ asset('css/post-create.css') }}">
@endsection

@section('main-content')
    <div class="container">
        <div class="create-post-container">
            <div class="post-header">
                <h1>Create a New Post</h1>
                <p>Share your thoughts with the community</p>
            </div>

            <div class="community-selector">
                <label for="community">Select Community</label>
                <div class="select-wrapper">
                    <select id="community">
                        <option value="">Choose a community</option>
                        <option value="technology">Technology</option>
                        <option value="design">Design</option>
                        <option value="photography">Photography</option>
                    </select>
                </div>
            </div>

            <div class="post-tabs">
                <div class="post-tab active">
                    <i class="fa fa-file-text"></i> Text
                </div>
                <div class="post-tab"><i class="fa fa-image"></i> Image</div>
                <div class="post-tab"><i class="fa fa-link"></i> Link</div>
            </div>

            <form id="postForm">
                <div class="form-group">
                    <input type="text" id="postTitle" placeholder="Title" required />
                </div>

                <div class="form-group">
                    <div class="formatting-bar">
                        <button type="button" class="format-btn">
                            <i class="fa fa-bold"></i>
                        </button>
                        <button type="button" class="format-btn">
                            <i class="fa fa-italic"></i>
                        </button>
                        <button type="button" class="format-btn">
                            <i class="fa fa-list-ul"></i>
                        </button>
                        <button type="button" class="format-btn">
                            <i class="fa fa-list-ol"></i>
                        </button>
                        <button type="button" class="format-btn">
                            <i class="fa fa-code"></i>
                        </button>
                    </div>
                    <textarea id="postContent" placeholder="What's on your mind?" required></textarea>
                </div>

                <div class="post-buttons">
                    <button type="submit" class="post-btn post-submit">Post</button>
                    <button type="button" class="post-btn post-draft">
                        Save as Draft
                    </button>
                </div>
            </form>
        </div>
    </div>
@endsection


@section('import-js')
    <script src="{{ asset('js/post-create.js') }}"></script>
@endsection
