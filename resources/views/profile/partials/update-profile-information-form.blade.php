<section>

    <form id="send-verification" method="post" action="{{ route('verification.send') }}">
        @csrf
    </form>

    <form method="post" action="{{ route('profile.update') }}" class="mt-6 space-y-6">
        @csrf
        @method('patch')

        <div>
            <x-input-label for="name" :value="__('Name')" />
            <x-text-input id="name" name="name" type="text" class="mt-1 block w-full" :value="old('name', $user->name)" required
                autofocus autocomplete="name" />
            <x-input-error class="mt-2" :messages="$errors->get('name')" />
        </div>

        <div class="form-group">
            <x-input-label for="email" :value="__('Email')" />
            <x-text-input id="email" name="email" type="email" class="mt-1 block w-full" :value="old('email', $user->email)"
                required autocomplete="username" />
            <x-input-error class="mt-2" :messages="$errors->get('email')" />

            @if ($user instanceof \Illuminate\Contracts\Auth\MustVerifyEmail && !$user->hasVerifiedEmail())
                <div>
                    <p class="text-sm mt-2 text-gray-800 dark:text-gray-200">
                        {{ __('Your email address is unverified.') }}

                        <button form="send-verification"
                            class="underline text-sm text-gray-600 dark:text-gray-400 hover:text-gray-900 dark:hover:text-gray-100 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 dark:focus:ring-offset-gray-800">
                            {{ __('Click here to re-send the verification email.') }}
                        </button>
                    </p>

                    @if (session('status') === 'verification-link-sent')
                        <p class="mt-2 font-medium text-sm text-green-600 dark:text-green-400">
                            {{ __('A new verification link has been sent to your email address.') }}
                        </p>
                    @endif
                </div>
            @endif
        </div>

        <div class="form-group">
            <x-input-label for="bio" :value="__('Bio')" />
            <textarea id="bio" name="bio" class="mt-1 block w-full form-input" rows="4">{{ old('bio', $user->bio) }}</textarea>
            <x-input-error class="mt-2" :messages="$errors->get('bio')" />
        </div>

        <div class="form-group">
            <x-input-label for="work" :value="__('Work')" />
            <x-text-input id="work" name="work" type="text" class="mt-1 block w-full" :value="old('work', $user->work)"
                autocomplete="organization" />
            <x-input-error class="mt-2" :messages="$errors->get('work')" />
        </div>

        <div class="form-group">
            <x-input-label for="education" :value="__('Education')" />
            <x-text-input id="education" name="education" type="text" class="mt-1 block w-full" :value="old('education', $user->education)"
                autocomplete="off" />
            <x-input-error class="mt-2" :messages="$errors->get('education')" />
        </div>

        <div class="form-group">
            <x-input-label for="location" :value="__('Location')" />
            <x-text-input id="location" name="location" type="text" class="mt-1 block w-full" :value="old('location', $user->location)"
                autocomplete="home city" />
            <x-input-error class="mt-2" :messages="$errors->get('location')" />
        </div>

        <div class="form-group">
            <x-input-label for="website" :value="__('Website')" />
            <x-text-input id="website" name="website" type="url" class="mt-1 block w-full" :value="old('website', $user->website)"
                autocomplete="url" />
            <x-input-error class="mt-2" :messages="$errors->get('website')" />
        </div>

        <div class="flex items-center gap-4">
            <button type="submit" class="btn-primary">{{ __('Save') }}</button>
        </div>
    </form>
</section>
