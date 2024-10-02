// Show OTP field when the "Xác thực" button for email is clicked
document.getElementById('verifyEmailBtn').addEventListener('click', function(event) {
    event.preventDefault();
    // Show OTP input field
    document.getElementById('otpField').style.display = 'block';
});

// Verify OTP and disable email input field on successful verification
document.getElementById('confirmOtpBtn').addEventListener('click', function() {
    const enteredOtp = document.getElementById('otp').value;

    // Simulating OTP check with backend (replace with actual verification call)
    if (enteredOtp === 'expectedOtp') { // Replace 'expectedOtp' with actual OTP sent from the server
        // Disable the email input field and verification button
        document.getElementById('email').setAttribute('disabled', 'true');
        document.getElementById('verifyEmailBtn').setAttribute('disabled', 'true');
        alert('Mã xác thực đúng. Email đã được xác nhận!');
    } else {
        alert('Mã xác thực không đúng. Vui lòng thử lại!');
    }
});