
    const navLinks = document.querySelectorAll('.nav-link');

    // Function to handle link click
    function handleLinkClick(event) {
        // Remove "active" class from all links
        navLinks.forEach(link => link.classList.remove('active'));

        // Add "active" class to the clicked link
        event.target.classList.add('active');
    }

    // Add click event listeners to all navigation links
    navLinks.forEach(link => {
        link.addEventListener('click', handleLinkClick);
    });
