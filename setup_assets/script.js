
function onLoad()
{
    fetch('./setup.php')
    .then(resp => resp.json())
    .then(resp => {
        if(resp['status'] == 2)
        {
            document.getElementById("page_icon").setAttribute("src", "/setup_assets/img/alert.png");
            document.getElementById("main-card-title").textContent = "Looks Like The Server Has Been Recently Used!";
            document.getElementById("main-card-title").setAttribute("style", "font-weight: bold; color: red");
            document.getElementById("warn-block-user").setAttribute("style", "display: block")
            document.getElementById("main-text-setup-warn-used").textContent = "Someone has recently tested this " + resp['diff'] + " ago."
        }
        else if(resp['status'] == 1)
        {
            document.getElementById("page_icon").setAttribute("src", "/setup_assets/img/checkmark.png");
            document.getElementById("main-card-title").textContent = "Alright Right! The Backend is Ready!";
            document.getElementById("main-card-title").setAttribute("style", "font-weight: bold; color: green");
            document.getElementById("first-run-user-msg-success").setAttribute("style", "display: block")
        }
        else if(resp['status'] == 0)
        {
            document.getElementById("page_icon").setAttribute("src", "/setup_assets/img/alert.png");
            document.getElementById("main-card-title").setAttribute("style", "color: red");
            document.getElementById("main-card-title").textContent = "Sorry! Something went wrong!";
            document.getElementById("server-error").setAttribute("style", "color: red; display: block;");
            document.getElementById("server-error").textContent = resp['message'];
        }
    });
    
}


function onReset()
{
    document.getElementById("page_icon").setAttribute("src", "./setup_assets/img/loading.gif")
    document.getElementById("main-card-title").textContent = "Resetting... This May Take a Minute. Please wait...";
    document.getElementById("main-card-title").setAttribute("style", "font-weight: bold; color: black;")
    document.getElementById("warn-block-user").setAttribute("style", "display: none;")
    document.getElementById("first-run-user-msg-success").setAttribute("style", "display: none;")

    fetch("./setup.php?resetop")
    .then(resp => resp.json())
    .then(data => {
        if(data['status'] == 1)
        {
            window.location.replace("./index.php");
        }
        else if(data['status'] == 0)
        {
            document.getElementById("page_icon").setAttribute("src", "/setup_assets/img/alert.png");
            document.getElementById("main-card-title").setAttribute("style", "color: red");
            document.getElementById("main-card-title").textContent = "An error occured while resetting!";
            document.getElementById("server-error").setAttribute("style", "color: red; display: block;");
            document.getElementById("server-error").textContent = data['message'];
        }
    })
}

function redirectFront()
{
    window.location.replace("./setup.php?redir");
}