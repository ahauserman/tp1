var wrapper = document.getElementById("myHTMLWrapper");

var myHTML = '';

for (var i = 0; i < 10; i++) {
    myHTML += '<span class="test">Testing out my script! loop #' + (i + 1) + '</span><br/><br/>';
}

wrapper.innerHTML = myHTML

