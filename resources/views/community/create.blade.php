@extends('partials.main')

@section('import-css')
    <link rel="stylesheet" href="{{ asset('css/communities.css') }}">
@endsection

@section('main-content')
    <div class="create-community-container">
        <div class="create-community-header">
            <h1 class="create-community-title">
                <i class="fa fa-plus-circle"></i>
                Create New Community
            </h1>
        </div>

        <form action="{{ route('communities.store') }}" method="POST" enctype="multipart/form-data"
            class="create-community-form">
            @csrf

            <div class="form-group">
                <label for="name">Community Name</label>
                <input type="text" id="name" name="name" class="form-control @error('name') is-invalid @enderror"
                    value="{{ old('name') }}" required>
                @error('name')
                    <span class="invalid-feedback">{{ $message }}</span>
                @enderror
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control @error('description') is-invalid @enderror"
                    rows="4" required>{{ old('description') }}</textarea>
                @error('description')
                    <span class="invalid-feedback">{{ $message }}</span>
                @enderror
            </div>

            <div class="form-group">
                <label for="avatar">Community Avatar</label>
                <input type="file" id="avatar" name="avatar"
                    class="form-control @error('avatar') is-invalid @enderror" accept="image/*">
                @error('avatar')
                    <span class="invalid-feedback">{{ $message }}</span>
                @enderror
            </div>

            <div class="form-group">
                <label for="tags">Tags (comma separated)</label>
                <input type="text" id="tags" name="tags" class="form-control @error('tags') is-invalid @enderror"
                    value="{{ old('tags') }}" placeholder="e.g. technology, programming, web development">
                @error('tags')
                    <span class="invalid-feedback">{{ $message }}</span>
                @enderror
            </div>

            <div class="form-group">
                <label class="checkbox-container">
                    <input type="checkbox" name="is_private" value="1" {{ old('is_private') ? 'checked' : '' }}>
                    Make this community private
                    <span class="checkmark"></span>
                </label>
                <small class="form-text text-muted">Private communities require approval for new members to join.</small>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Create Community</button>
                <a href="{{ route('community.index') }}" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
@endsection

@section('import-js')
    <script src="{{ asset('js/communities.js') }}"></script>
@endsection
