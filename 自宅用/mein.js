document.addEventListener('DOMContentLoaded', function() {
    fetch('/update_view_count', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ pageId: 'portfolio_home' })
    })
    .then(response => response.json())
    .then(data => {
        console.log('Page view count updated:', data);
    })
    .catch((error) => {
        console.error('Error:', error);
    });
});
