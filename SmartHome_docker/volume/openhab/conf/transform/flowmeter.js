// Wrap everything in a function
(function(i) {
    var value = ( parseFloat(i) / 10 );
    if (value <= 9.2) {
        value = 0;
    }
    return value;
})(input)
// input variable contains data passed by openhab