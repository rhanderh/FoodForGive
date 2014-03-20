var handler = StripeCheckout.configure({
    key: 'pk_test_m7pP4iOBh17N1YhakEfds5FU',
    image: 'assets/purplecherub12-u2852.png',
    token: function(token, args) {
      // Use the token to create the charge with a server-side script.
    }
  });

  document.getElementById('customButton').addEventListener('click', function(e) {
    // Open Checkout with further options
    handler.open({
      name: 'Food ForGive',
      description: '2 widgets ($20.00)',
      amount: 500
    });
    e.preventDefault();
  });
  


