@props([
    'id' => '',
    'title' => '',
    'message' => '',
    'confirmText' => 'Confirm',
    'cancelText' => 'Cancel',
    'type' => 'default', // default, danger, success
])

<div class="modal" id="{{ $id }}">
    <div class="modal-content">
        @if ($type === 'danger')
            <div class="modal-icon danger">
                <i class="fa fa-exclamation-triangle"></i>
            </div>
        @elseif($type === 'success')
            <div class="modal-icon success">
                <i class="fa fa-check-circle"></i>
            </div>
        @endif
        <h3>{{ $title }}</h3>
        <p>{{ $message }}</p>
        <div class="modal-buttons">
            <button class="modal-btn cancel">{{ $cancelText }}</button>
            <button class="modal-btn confirm {{ $type }}">{{ $confirmText }}</button>
        </div>
    </div>
</div>

<style>
    .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(22, 32, 44, 0.8);
        z-index: 1000;
        justify-content: center;
        align-items: center;
    }

    .modal.active {
        display: flex;
    }

    .modal-content {
        background-color: #1a2332;
        padding: 2rem;
        border-radius: 12px;
        box-shadow: 6px 6px 12px #131c27, -6px -6px 12px #2b3647;
        max-width: 400px;
        width: 90%;
        text-align: center;
    }

    .modal-icon {
        font-size: 2.5rem;
        margin-bottom: 1rem;
    }

    .modal-icon.danger {
        color: #ef4444;
    }

    .modal-icon.success {
        color: #10b981;
    }

    .modal-content h3 {
        margin: 0 0 1rem 0;
        color: #e5e7eb;
        font-size: 1.25rem;
        font-weight: 500;
    }

    .modal-content p {
        margin: 0 0 1.5rem 0;
        color: #9ca3af;
        line-height: 1.5;
    }

    .modal-buttons {
        display: flex;
        justify-content: center;
        gap: 1rem;
    }

    .modal-btn {
        padding: 0.5rem 1rem;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-weight: 500;
        transition: all 0.2s;
        color: #e5e7eb;
        min-width: 100px;
    }

    .modal-btn.cancel {
        background-color: #1a2332;
        color: #9ca3af;
        box-shadow: 3px 3px 6px #131c27, -3px -3px 6px #2b3647;
    }

    .modal-btn.cancel:hover {
        color: #e5e7eb;
        box-shadow: 4px 4px 8px #131c27, -4px -4px 8px #2b3647;
    }

    .modal-btn.cancel:active {
        box-shadow: inset 3px 3px 6px #131c27, inset -3px -3px 6px #2b3647;
    }

    .modal-btn.confirm {
        background-color: #3b82f6;
        color: #ffffff;
        box-shadow: 3px 3px 6px #2d65c0, -3px -3px 6px #479fff;
    }

    .modal-btn.confirm:hover {
        box-shadow: 4px 4px 8px #2d65c0, -4px -4px 8px #479fff;
    }

    .modal-btn.confirm:active {
        box-shadow: inset 3px 3px 6px #2d65c0, inset -3px -3px 6px #479fff;
    }

    .modal-btn.confirm.danger {
        background-color: #ef4444;
        box-shadow: 3px 3px 6px #b91c1c, -3px -3px 6px #f87171;
    }

    .modal-btn.confirm.danger:hover {
        box-shadow: 4px 4px 8px #b91c1c, -4px -4px 8px #f87171;
    }

    .modal-btn.confirm.danger:active {
        box-shadow: inset 3px 3px 6px #b91c1c, inset -3px -3px 6px #f87171;
    }

    .modal-btn.confirm.success {
        background-color: #10b981;
        box-shadow: 3px 3px 6px #047857, -3px -3px 6px #34d399;
    }

    .modal-btn.confirm.success:hover {
        box-shadow: 4px 4px 8px #047857, -4px -4px 8px #34d399;
    }

    .modal-btn.confirm.success:active {
        box-shadow: inset 3px 3px 6px #047857, inset -3px -3px 6px #34d399;
    }
</style>
