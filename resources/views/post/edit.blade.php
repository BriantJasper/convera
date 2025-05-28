@extends('partials.main')

@section('import-css')
    <link rel="stylesheet" href="{{ asset('css/post-edit.css') }}">
@endsection

@section('main-content')
    <div class="container">
        <div class="edit-post-container" data-csrf-token="{{ csrf_token() }}">
            <div class="post-header">
                <h1>
                    Edit Post
                    <span class="changes-indicator" id="changesIndicator" style="display: none">Unsaved Changes</span>
                </h1>
                <p>Make changes to your post</p>
            </div>

            <div class="post-info-bar">
                <div class="info-item">
                    <i class="fa fa-calendar"></i>
                    <span>Created: <span id="createdDate">{{ $post->created_at->diffForHumans() }}</span></span>
                </div>
                <div class="info-item">
                    <i class="fa fa-edit"></i>
                    <span>Last edited: <span
                            id="lastEdited">{{ $post->edited_at ? $post->edited_at->diffForHumans() : 'Never' }}</span></span>
                </div>
                <div class="info-item">
                    <i class="fa fa-eye"></i>
                    <span><span id="viewCount">{{ $post->views_count ?? 0 }}</span> views</span>
                </div>
            </div>

            <form id="editForm" action="{{ route('posts.update', $post->slug) }}" method="POST">
                @csrf
                @method('PUT')

                <div class="community-selector">
                    <label for="community">Community</label>
                    <div class="select-wrapper">
                        <select id="community" name="community_id" required>
                            <option value="">Choose a community</option>
                            @foreach ($communities as $community)
                                <option value="{{ $community->id }}"
                                    {{ $post->community_id == $community->id ? 'selected' : '' }}>
                                    {{ $community->name }}
                                </option>
                            @endforeach
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

                <div class="form-group">
                    <input type="text" id="postTitle" name="title" placeholder="Title"
                        value="{{ old('title', $post->title) }}" required />
                    @error('title')
                        <span class="error-message">{{ $message }}</span>
                    @enderror
                </div>

                <div class="form-group">
                    <div class="formatting-bar">
                        <button type="button" class="format-btn" title="Bold">
                            <i class="fa fa-bold"></i>
                        </button>
                        <button type="button" class="format-btn" title="Italic">
                            <i class="fa fa-italic"></i>
                        </button>
                        <button type="button" class="format-btn" title="Bullet List">
                            <i class="fa fa-list-ul"></i>
                        </button>
                        <button type="button" class="format-btn" title="Numbered List">
                            <i class="fa fa-list-ol"></i>
                        </button>
                        <button type="button" class="format-btn" title="Code">
                            <i class="fa fa-code"></i>
                        </button>
                        <button type="button" class="format-btn" title="Link">
                            <i class="fa fa-link"></i>
                        </button>
                    </div>
                    <textarea id="postContent" name="content" placeholder="What's on your mind?" required>{{ old('content', $post->content) }}</textarea>
                    @error('content')
                        <span class="error-message">{{ $message }}</span>
                    @enderror
                </div>

                <div class="post-buttons">
                    <button type="submit" class="post-btn post-update">
                        <i class="fa fa-save"></i> Update Post
                    </button>
                    <button type="button" class="post-btn post-cancel" id="cancelBtn">
                        <i class="fa fa-times"></i> Cancel
                    </button>
                    <button type="button" class="post-btn post-delete" id="deleteBtn">
                        <i class="fa fa-trash"></i> Delete Post
                    </button>
                </div>
            </form>
        </div>
    </div>

    <x-modal id="unsavedChangesModal" title="Confirm Changes"
        message="You have unsaved changes. Would you like to save them?" confirmText="Save Changes"
        cancelText="Discard Changes" type="success" />

    <x-modal id="deleteModal" title="Delete Post"
        message="Are you sure you want to delete this post? This action cannot be undone and all comments and reactions will be permanently removed."
        confirmText="Delete Post" cancelText="Cancel" type="danger" />

    <x-modal id="updateModal" title="Update Post"
        message="Are you sure you want to update this post? This will be visible to all users." confirmText="Update Post"
        cancelText="Cancel" type="success" />
@endsection

@section('import-js')
    <script type="module" src="{{ asset('js/modal.js') }}"></script>
    <script type="module" src="{{ asset('js/post-edit.js') }}"></script>
@endsection
